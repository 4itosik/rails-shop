require 'spec_helper'

describe	SubcategoriesController do


	describe "action show " do 
#		it "renderis show templates" do
#			category = create(:category)
#			subcategory = create(:subcategory, category_id: category.id) 
#			product = create(:product, subcategory_id: subcategory.id)
#			get :show, id: product.id
#			response.should render_template('show')
#		end

		it "renderis 404 errors if subcategory.category_id != category.id" do
			category1 = create(:category)
			category2 = create(:category)
			subcategory = create(:subcategory, category_id: category1.id)
			get :show, {category: category1.alias, subcategory: subcategory.alias }
			response.should render_template(:file => "#{Rails.root}/public/404.html")
		end
	end
end