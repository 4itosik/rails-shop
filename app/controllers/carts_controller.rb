class CartsController < ApplicationController
	def add_to_cart
		@cart_product = CartProduct.where("product_id = ? and cart_id =?", params[:cart_product][:product_id], @cart.id).first
		if @cart_product == nil
			begin
				product = Product.find(params[:cart_product][:product_id])
			rescue ActiveRecord::RecordNotFound
			else
				@cart_product = CartProduct.new(cart_product_params)
				@cart_product.cart_id = @cart.id
				@cart_product.save
			end
		else
			@cart_product.add_qty(params[:cart_product][:quantity].to_i)
			@cart_product.save
		end
		@cart.price_total
	end

	def update_qty
		@cart_product = CartProduct.find(params[:cart_product_id])
		@cart_product.update_quantity(params[:quantity].to_i)
		@cart_product.save
		@cart.price_total
		data = Array.new
		data = [@cart_product.total, @cart.total]
		respond_to do |format|
		  format.json  { render :json => data } 
		end
	end

	def index
		@cart_products = @cart.cart_products
	end

	private
	  def cart_product_params
	    params.require(:cart_product).permit(:product_id, :quantity)
	  end
end
