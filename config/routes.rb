RailsShop::Application.routes.draw do
  root :to => 'categories#index'
  #----start admin routes
  devise_for :administrators
  devise_scope :administrators do
    root to: "admin/dashboard#index" 
  end


  #admin routes
  namespace :admin do
    resources  :dashboard, only: [:index]
    resources  :categories, :subcategories, :products, :deliveries
  end


  #js admin routes
  get '/admin_sub_category_update/:id', to: 'admin/dashboard#sub_category_update'
  #----end admin routes
  
  #category, subcategory, products routes
  get '/categories', to: 'categories#index', as: 'categories'
  get '/:category', to: 'categories#show',constraints: {category: /#{Category.all.map{|c|c.alias}.join('|')}/ }, as: 'category'
  get '/:category/:subcategory', to: 'subcategories#show', constraints: {category: /#{Category.all.map{|c|c.alias}.join('|')}/, subcategory: /#{Subcategory.all.map{|c|c.alias}.join('|')}/}, as: 'subcategory'
  get '/:category/:subcategory/:product', to: 'products#show', constraints: {category: /#{Category.all.map{|c|c.alias}.join('|')}/, subcategory: /#{Subcategory.all.map{|c|c.alias}.join('|')}/, product: /#{Product.all.map{|c|c.alias}.join('|')}/}, as: 'product'

  #carts rourtes
  post '/add_to_cart/', to: 'carts#add_to_cart', as: 'add_to_cart'
end
