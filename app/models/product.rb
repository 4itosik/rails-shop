class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  after_save	               :reload_routes
  validates 	               :name,  :price, :body, :alias,  :presence  => true
  validates 	               :alias, :uniqueness => true
  validates		               :price,  :numericality => {:greater_than => 0}
  belongs_to	               :subcategory
  validates 	               :subcategory, :presence => true
  has_many                   :cart_products, dependent: :destroy
  has_many                   :comments, as: :commentable, dependent: :destroy
  has_and_belongs_to_many    :value_property_products

  def update_property(value_property_products)
    product_value_property_products = self.value_property_products
    unless product_value_property_products.empty?
      self.value_property_products.destroy(product_value_property_products)
      product_value_property_products.each do |product_value_property_product|
        products = product_value_property_product.products
        product_value_property_product.destroy if products.empty?
      end
    end
    value_property_products.each do |property_id, property_value|
      update_or_create_value_property_product(property_id, property_value)
    end
  end
  
  private
  	def reload_routes
  		RailsShop::Application.reload_routes!
  	end

    def update_or_create_value_property_product(property_id, property_value)
      new_value_property_product = ValuePropertyProduct.where(:property_id => property_id, :value => property_value).first
      if new_value_property_product == nil
        new_value_property_product = ValuePropertyProduct.create(:property_id => property_id, :value => property_value)
      end
      self.value_property_products << new_value_property_product      
    end
end
