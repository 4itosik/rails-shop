class CartProduct < ActiveRecord::Base
  # attr_accessible :title, :body
  before_save		:update_total
  belongs_to		:cart
  belongs_to		:product
  belongs_to		:order
  private
  	def update_total
  		self.total = self.product.price * self.quantity
  	end
end
