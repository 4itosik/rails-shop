class Admin::DashboardController < ApplicationController
	#respond_to :html, :json
	before_filter :authenticate_administrator!
	layout "admin"
	def index
	end

	#js -update subcategory
	def sub_category_update
		subcategory = Subcategory.find_all_by_category_id(params[:id])
		respond_to do |format|
			format.json { render :json => subcategory}
		end
	end

	def admin_property_update
		subcategory = Subcategory.find(params[:id])
		@properties = subcategory.properties 
	end
end
