module ParksHelper
  def colorize(score)
    str = ""
    case score
    when 90..100 then str += "green"
    when 80..89 then str += "blue"
    when 70..79 then str += "yellow"
    when 60..69 then str += "orange"
    when 1..59 then str += "red"
    end
    str.html_safe
  end

  def display_grade(evaluation)
    evaluation ? evaluation : "n/a"
  end

  # def map_url_builder(park)
  #   str = "https://maps.googleapis.com/maps/api/staticmap?"
  #   str += "center=#{park.parkname}"
  #   str += add_zoom(park.acreage)
  #   str += "&size=600x600"
  #   str += "&maptype=roadmap"
  #   str += add_marker(park.location_coordinates) if park.location_coordinates
  #   str += add_key
  #   str.html_safe
  # end
  #
  # # def add_zoom(acreage)
  # #   case acreage
  # #   when 200..1200 then "&zoom=13"
  # #   when 50..199 then "&zoom=14"
  # #   when 10..49 then "&zoom=15"
  # #   when 2.0..9 then "&zoom=16"
  # #   when 1..1.9 then "&zoom=17"
  # #   else "&zoom=18"
  # #   end
  # # end
  # #
  # # def add_key
  # #   "&key=#{Rails.application.secrets.google_api_key}"
  # # end
  # #
  # # def add_marker(coords)
  # #   arr_coords = coords[1..-2].split(", ")
  # #   "&markers=color:red%7Clabel:A%7C#{arr_coords[1]},#{arr_coords[0]}"
  # # end

  # for the JS map
  def coord_maker(coords)
    arr_coords = coords[1..-2].split(", ")
  end
end

#
# &markers=color:green%7Clabel:G%7C40.711614,-74.012318
# &markers=color:red%7Clabel:C%7C40.718217,-73.998284"
