class CartsController < ApplicationController

	def add_to_cart
		@cart = current_cart
		@cart_product = CartProduct.new(cart_product_params)
		@cart_product.save
	end
	private
	  def cart_product_params
	    params.require(:cart_product).permit(:product_id, :quantity, :cart_id => @cart.id)
	  end
end
