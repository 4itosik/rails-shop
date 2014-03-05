class Order < ActiveRecord::Base
  # attr_accessible :title, :body
  before_save		:update_total
  has_many			:cart_products, dependent: :destroy
  belongs_to		:delivery
  private
  	def update_total
  		self.product_price = self.cart_products.map(&:total).inject(:+)
  		self.deliver_price = self.delivery.price
  		self.total = self.product_price + self.deliver_price
  	end
end
