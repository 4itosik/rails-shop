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
    resources  :categories, :subcategories, :deliveries, :properties
    resources  :products do
      post 'search', on: :collection
    end
  end

  #js admin routes
  get '/admin_sub_category_update/:id', to: 'admin/dashboard#sub_category_update'
  get '/admin_property_update/:id', to: 'admin/dashboard#admin_property_update'
  #----end admin routes
  
  #category, subcategory, products routes
  get '/catalog', to: 'categories#index', as: 'categories'
  get '/catalog/:category', to: 'categories#show',constraints: {category: /#{Category.all.map{|c|c.alias}.join('|')}/ }, as: 'category'
  get '/catalog/:category/:subcategory', to: 'subcategories#show', constraints: {category: /#{Category.all.map{|c|c.alias}.join('|')}/, subcategory: /#{Subcategory.all.map{|c|c.alias}.join('|')}/}, as: 'subcategory'
  get '/catalog/:category/:subcategory/:product', to: 'products#show', constraints: {category: /#{Category.all.map{|c|c.alias}.join('|')}/, subcategory: /#{Subcategory.all.map{|c|c.alias}.join('|')}/, product: /#{Product.all.map{|c|c.alias}.join('|')}/}, as: 'product'
  # end category, subcategory, products routes

  #carts rourtes
  post '/add_to_cart/', to: 'carts#add_to_cart', as: 'add_to_cart'
  get '/carts', to: 'carts#index', as: 'carts'
  post '/carts/update_qty', to: 'carts#update_qty', as: 'update_qty'
  #end carts routes


  #comment routes
  resources :comments, only: [:create]
  #end

end
