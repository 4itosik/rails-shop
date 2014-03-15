class ValuePropertyProduct < ActiveRecord::Base
  attr_accessible :value, :product_id, :property_id
  belongs_to	:property
  belongs_to	:product
end
