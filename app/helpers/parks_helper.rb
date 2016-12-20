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

end
