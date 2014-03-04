require 'spec_helper'

describe	ProductsController do


	describe "action show " do 
		it "render templatis show" do
			category1 = create(:category)
			subcategory = create(:subcategory, category_id: category1.id)
			product = create(:product, subcategory_id: subcategory.id)
			get :show, {category: category1.alias, subcategory: subcategory.alias, product: product.alias }
			response.should render_template('show')
		end

		it "render 404 errors if subcategory.category_id != category.id" do
			category1 = create(:category)
			subcategory = create(:subcategory)
			product = create(:product)
			get :show, {category: category1.alias, subcategory: subcategory.alias, product: product.alias }
			response.should render_template(:file => "#{Rails.root}/public/404.html")
		end
	end
end