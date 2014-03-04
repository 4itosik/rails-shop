class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find_by_alias(params[:category])
		@subcategories = @category.subcategories
	end
end
