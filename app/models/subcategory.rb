class Subcategory < ActiveRecord::Base
  # attr_accessible :title, :body
  after_save	:reload_routes
  validates 	:name, :alias,  :presence  => true
  validates 	:alias, :uniqueness => true
  belongs_to	:category
  has_many		:products, dependent: :destroy
  validates 	:category, :presence => true
  private
  	def reload_routes
  		RailsShop::Application.reload_routes!
  	end
end
