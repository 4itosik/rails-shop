class Cart < ActiveRecord::Base
  #attr_accessible :total
  has_many	:cart_products, dependent: :destroy
  def price_total
  	self.update_attributes(:total => self.cart_products.map(&:total).inject(:+))
  end
end
