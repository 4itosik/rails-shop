class ProductsController < ApplicationController

	def show
		@category = Category.find_by_alias(params[:category])
		@subcategory = Subcategory.find_by_alias(params[:subcategory])
		@product = Product.find_by_alias(params[:product])
		@comment = Comment.new
		@comments = @product.comments
		@value_property_products = @product.value_property_products
		render :file => 'public/404.html', :status => :not_found, :layout => false unless @subcategory.category_id == @category.id && @product.subcategory_id == @subcategory.id
	end
end
