class Delivery < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :title, :price,  :presence  => true
  has_many	:orders
end
