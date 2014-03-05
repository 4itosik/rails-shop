class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  after_save	:reload_routes
  validates 	:name,  :price, :body, :alias,  :presence  => true
  validates 	:alias, :uniqueness => true
  validates		:price,  :numericality => {:greater_than => 0}
  belongs_to	:subcategory
  validates 	:subcategory, :presence => true
  has_many    :cart_products, dependent: :destroy
  private
  	def reload_routes
  		RailsShop::Application.reload_routes!
  	end
end
