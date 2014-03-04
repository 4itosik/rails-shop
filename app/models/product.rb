class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :name,  :price, :body,  :presence  => true
  validates	:price,  :numericality => {:greater_than => 1}
end
