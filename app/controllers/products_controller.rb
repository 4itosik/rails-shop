class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		begin
			@product = Product.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end
end
