class Admin::DashboardController < ApplicationController
	before_filter :authenticate_administrator!
	layout "admin"
	def index
	end
end
