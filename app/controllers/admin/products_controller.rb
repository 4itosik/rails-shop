require 'will_paginate/array'
class Admin::ProductsController < ApplicationController
	before_filter :authenticate_administrator!
	layout "admin"
	def new
		@product = Product.new
	end
	
	def edit
		begin
			@product = Product.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def destroy
		begin
			product = Product.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		else
			product.destroy
    	redirect_to admin_products_path
    end
	end	

	def show
		begin
			@product = Product.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def update
    @product = Product.find(params[:id])
    if @product.update_attributes (person_params)
    	if params[:product][:value_property_products]
    		value_property_products = params[:product][:value_property_products]
    		@product.update_property(value_property_products)
    	end
    	flash[:notice] = "Successfully update product: #{@product.name}" 
    	redirect_to admin_products_path
    else
    	render :action => 'edit'
    end
	end

	def create
  	@product = Product.new
  	if @product.update_attributes (person_params)
    	flash[:notice] = "Successfully created product: #{@product.name}"
    	redirect_to admin_products_path
  	else
    	render :action => 'new'
  	end
	end

	def index
		@products = Product.all.sort_by{ |k| k['name']}.paginate(:page => params[:page], :per_page => 20)
	end

	private
	  def person_params
	    params.require(:product).permit(:name, :price, :body, :alias, :subcategory_id, :value_property_products => [])
	  end
end
