class Training < ActiveRecord::Base
  attr_accessible :description, :name, :rating, :gender, :works_attributes
  has_many :works
  accepts_nested_attributes_for :works, allow_destroy:true 
end
