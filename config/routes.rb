RailsShop::Application.routes.draw do
  root :to => 'products#index'
  devise_for :administrators
  devise_scope :administrators do
    root to: "admin/dashboard#index" 
  end


  #admin routes
  namespace :admin do
    resources  :dashboard, only: [:index]
    resources  :products
  end

  #products routes
  resources  :products, only: [:index, :show]
end
