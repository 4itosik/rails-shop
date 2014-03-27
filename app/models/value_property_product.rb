class ValuePropertyProduct < ActiveRecord::Base
  attr_accessible :value, :property_id
  belongs_to								:property
  has_and_belongs_to_many		:products
end
