class Admin::DashboardController < ApplicationController
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
end
