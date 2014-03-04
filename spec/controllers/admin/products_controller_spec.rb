require 'spec_helper'

describe Admin::ProductsController do


#	describe "action show " do 
#		it "renderis show templates" do
#			category = create(:category)
#			subcategory = create(:subcategory, category_id: category.id) 
#			product = create(:product, subcategory_id: subcategory.id)
#			get :show, id: product.id
#			response.should render_template('show')
#		end

		it "renderis 404 errors" do
			get :show, id: 0
			response.should render_template(:file => "#{Rails.root}/public/404.html")
		end
	end
end