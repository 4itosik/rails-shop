class OrdersController < ApplicationController
	def create
		@order = Order.new
		@order.update_attributes (order_params)
	end


	private
	  def order_params
	    params.require(:order).permit(:name)
	  end
end
