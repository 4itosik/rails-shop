require 'will_paginate/array'
class Admin::SubcategoriesController < ApplicationController
	before_filter :authenticate_administrator!
	layout "admin"
	def new
		@subcategory = Subcategory.new
	end
	
	def edit
		begin
			@subcategory = Subcategory.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def destroy
		subcategory = Subcategory.find(params[:id])
		if subcategory == nil
			render :file => 'public/404.html', :status => :not_found, :layout => false
		else
			subcategory.destroy
    	redirect_to admin_subcategories_path
    end
	end	

	def show
		begin
			@subcategory = Subcategory.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def update
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update_attributes (subcategory_params)
    	flash[:notice] = "Successfully update subcategory: #{@subcategory.name}" 
    	redirect_to admin_subcategories_path
    else
    	render :action => 'edit'
    end
	end

	def create
  	@subcategory = Subcategory.new
  	if @subcategory.update_attributes (subcategory_params)
    	flash[:notice] = "Successfully created subcategory: #{@subcategory.name}"
    	redirect_to admin_subcategories_path
  	else
    	render :action => 'new'
  	end
	end

	def index
		@subcategories = Subcategory.all.sort_by{ |k| k['name']}.paginate(:page => params[:page], :per_page => 20)
	end

	private
	  def subcategory_params
	    params.require(:subcategory).permit(:name, :alias, :category_id)
	  end
end
