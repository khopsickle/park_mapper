class ParksController < ApplicationController

  before_action :require_admin, only: [:refresh]

  skip_before_action :require_login, only: [:index, :show]

  def index
    @parks = Park.search(params[:query])
    filter_params.each do |key, value|
      @parks = @parks.public_send(key) if value.present?
    end
  end

  def show
    @park = Park.find_by_id(params[:id])
  end

  def refresh
    Park.delete_all
    @park_list = Soda.new.park_list
    @evaluation_list = Soda.new.evaluation_list
    save_list(@park_list)
    save_eval(@evaluation_list)
  end

  private

    def query_params
      params.permit(:query)
    end

    def filter_params
      params.slice(:eval_present, :desc_grades, :desc_acreage)
    end

    def save_list(list)
      list.each do |entry|
        unless entry["location_1"]
          entry["location_1"] = { "type" => nil }
        end

        Park.create(
          acreage: entry["acreage"].to_f,
          location_type: entry["location_1"]["type"],
          location_coordinates: entry["location_1"]["coordinates"],
          parkid: entry["parkid"].to_i,
          parkname: entry["parkname"].titleize,
          parktype: entry["parktype"],
          supdist: entry["supdist"].to_i,
          zipcode: entry["zipcode"].to_i
        )
      end
    end

    def save_eval(eval)
      eval.each do |entry|
        park = Park.where(parkname: entry["park"].titleize)
        park.update(evaluation: entry["park_site_score"])
      end
    end

end
