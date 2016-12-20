class Park < ApplicationRecord
  has_many :favorites

  def self.search(query)
    if query == "" || query.nil?
      where("")
    else
      where("zipcode = ?", "#{query}")
    end
  end

  def self.desc_grades
    order("evaluation DESC")
  end

  def self.desc_acreage
    order("acreage DESC")
  end

  def self.eval_present
    where.not('evaluation' => nil)
  end
end
