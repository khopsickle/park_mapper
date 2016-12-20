class Soda

  def initialize
    @client = SODA::Client.new(
      domain: Rails.application.secrets.domain,
      app_token: Rails.application.secrets.app_token
    )
  end

  def park_list
    JSON.parse(@client.get('94uf-amnx', {'$select' => "acreage, location_1, parkid, parkname, parktype, supdist, zipcode"}).to_json)
  end

  def evaluation_list
    JSON.parse(@client.get('urx2-yj58', {'$select' => "park, park_site_score, supervisor_district"}).to_json)
  end

  def jsonify
    to_json
  end

  def save_data(list)
    list.each do |entry|
      entry
    end
  end
end
