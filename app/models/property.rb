class Property < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many  :subcategories
  has_one									 :value_property_product
end
