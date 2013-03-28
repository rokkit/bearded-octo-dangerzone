class Work < ActiveRecord::Base
  belongs_to :training
  attr_accessible :name, :day, :set, :time, :weight, :training_id
end
