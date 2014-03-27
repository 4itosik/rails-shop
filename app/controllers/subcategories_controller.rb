class SubcategoriesController < ApplicationController

	def show
		@category = Category.find_by_alias(params[:category])
		@subcategory = Subcategory.find_by_alias(params[:subcategory])
		if @subcategory.category_id == @category.id
			@products = @subcategory.products
			@properties = @subcategory.properties
		else
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end
end
