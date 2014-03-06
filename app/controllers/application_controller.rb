class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  before_filter :cart
  def after_sign_in_path_for(administrator)
    if administrator.email != "admin@admin.ru" 
      root_path
    else
	    admin_dashboard_index_path
	  end
  end

  def cart
    @cart = current_cart
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
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
