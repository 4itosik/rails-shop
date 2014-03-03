class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  def after_sign_in_path_for(administrator)
    if administrator.email != "admin@admin.ru" 
      root_path
    else
	    admin_dashboard_index_path
	  end
  end
private
	  def layout_by_resource
    	if devise_controller?
        "admin"
    	else
    		"application"
      end
    end
end