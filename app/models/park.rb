class Park < ApplicationRecord

  def self.search(query)
    if query == "" || query.nil?
      where("")
    else
      where("zipcode = ?", "#{query}")
    end
  end

  def self.descending
    order("evaluation DESC")
  end

  def self.eval_present
    where.not('evaluation' => nil)
  end


end
