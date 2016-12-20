class ParksController < ApplicationController

  before_action :locked

  def refresh
    @park_list = Soda.new.park_list
    @evaluation_list = Soda.new.evaluation_list
    save_list(@park_list)
    save_eval(@evaluation_list)
  end

  def save_list(list)
    Park.destroy_all
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

  private

    # stop the app from pulling more data
    def locked
      true
    end
end
