class Category < ActiveRecord::Base
  #attr_accessible :name
  after_save	:reload_routes
  validates :name, :alias,  :presence  => true
  validates :alias, :uniqueness => true
  has_many	:subcategories, dependent: :destroy

  private
  	def reload_routes
  		RailsShop::Application.reload_routes!
  	end
end
