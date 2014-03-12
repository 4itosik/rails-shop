require 'will_paginate/array'
class Admin::PropertiesController < ApplicationController
	before_filter :authenticate_administrator!
	layout "admin"
	def new
		@property = Property.new
	end
	
	def edit
		begin
			@property = Property.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def destroy
		begin
			property = Property.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		else
			property.destroy
    	redirect_to admin_properties_path
    end
	end	

	def show
		begin
			@property = Property.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		else
			@subcategories = @property.subcategories
		end
	end

	def update
    @property = Property.find(params[:id])
    if @property.update_attributes (property_params)
    	flash[:notice] = "Successfully update product: #{@property.title}"
    	redirect_to admin_properties_path
    else
    	render :action => 'edit'
    end
	end

	def create
  	@property = Property.new
  	if @property.update_attributes (property_params)
    	flash[:notice] = "Successfully created product: #{@property.title}"
    	redirect_to admin_properties_path
  	else
    	render :action => 'new'
  	end
	end

	def index
		@properties = Property.all.paginate(:page => params[:page], :per_page => 20)
	end

	private
	  def property_params
	    params.require(:property).permit(:title, :sort, :subcategory_ids => [])
	  end
end

