class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many	:cart_products, dependent: :destroy
  private
  	def total
  		self.update_attributes(:total => self.cart_products.map(&:total).inject(:+)
  	end
end
