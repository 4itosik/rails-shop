require 'will_paginate/array'
class Admin::DeliveriesController < ApplicationController
	before_filter :authenticate_administrator!
	layout "admin"
	def new
		@delivery = Delivery.new
	end
	
	def edit
		begin
			@delivery = Delivery.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def destroy
		begin
			delivery = Delivery.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		else
			delivery.destroy
    	redirect_to admin_deliveries_path
    end
	end	

	def show
		begin
			@delivery = Delivery.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update_attributes (category_params)
    	flash[:notice] = "Successfully update delivery: #{@delivery.title}" 
    	redirect_to admin_deliveries_path
    else
    	render :action => 'edit'
    end
	end

	def create
  	@delivery = Delivery.new
  	if @delivery.update_attributes (category_params)
    	flash[:notice] = "Successfully created delivery: #{@delivery.title}"
    	redirect_to admin_deliveries_path
  	else
    	render :action => 'new'
  	end
	end

	def index
		@deliveries = Delivery.all.paginate(:page => params[:page], :per_page => 20)
	end

	private
	  def category_params
	    params.require(:delivery).permit(:title, :price, :price_km)
	  end
end
