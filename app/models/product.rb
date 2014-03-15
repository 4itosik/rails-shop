class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  after_save	:reload_routes
  validates 	:name,  :price, :body, :alias,  :presence  => true
  validates 	:alias, :uniqueness => true
  validates		:price,  :numericality => {:greater_than => 0}
  belongs_to	:subcategory
  validates 	:subcategory, :presence => true
  has_many    :cart_products, dependent: :destroy
  has_many    :comments, as: :commentable, dependent: :destroy
  has_many    :value_property_products, dependent: :destroy  

  def update_property(value_property_products)
        value_property_products.each do |id, value|
          unless value == ""
            value_property = ValuePropertyProduct.where(:product_id => self.id, :property_id => id)
            if value_property.empty?
              ValuePropertyProduct.create(:value => value, :product_id => self.id, :property_id => id)
            else
              value_property.first.update_attributes(:property_id => id, :value => value)
            end
          else
            value_property = ValuePropertyProduct.where(:product_id => self.id, :property_id => id)
            value_property.first.delete unless value_property.empty? 
          end
        end
    end
  private
  	def reload_routes
  		RailsShop::Application.reload_routes!
  	end
end
