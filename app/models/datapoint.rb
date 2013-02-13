class Datapoint < ActiveRecord::Base
  attr_accessible :value, :error, :dataType, :time, :group_int
  has_one :experiment
end
