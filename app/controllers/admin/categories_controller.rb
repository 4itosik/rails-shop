require 'will_paginate/array'
class Admin::CategoriesController < ApplicationController
	before_filter :authenticate_administrator!
	#after_filter :rel_routes, :only => [:destroy, :create, :update]
	layout "admin"
	def new
		@category = Category.new
	end
	
	def edit
		begin
			@category = Category.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def destroy
		begin
			category = Category.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		else
			category.destroy
    	redirect_to admin_categories_path
    end
	end	

	def show
		begin
			@category = Category.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def update
    @category = Category.find(params[:id])
    if @category.update_attributes (category_params)
    	flash[:notice] = "Successfully update category: #{@category.name}" 
    	redirect_to admin_categories_path
    else
    	render :action => 'edit'
    end
	end

	def create
  	@category = Category.new
  	if @category.update_attributes (category_params)
    	flash[:notice] = "Successfully created category: #{@category.name}"
    	redirect_to admin_categories_path
  	else
    	render :action => 'new'
  	end
	end

	def index
		@categories = Category.all.sort_by{ |k| k['name']}.paginate(:page => params[:page], :per_page => 20)
	end

	private
	  def category_params
	    params.require(:category).permit(:name, :alias)
	  end
end
