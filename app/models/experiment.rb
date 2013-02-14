class Experiment < ActiveRecord::Base
  attr_accessible :startTime
  has_many :datapoints

end
