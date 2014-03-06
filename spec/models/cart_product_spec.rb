require 'spec_helper'

describe CartProduct do

  it "test update_total after save" do
		product = create(:product, price: 1)
		cart_product = create(:cart_product,product_id: product.id)
		cart_product.total.should == product.price
	end

	it "test update qty" do
		product = create(:product, price: 1)
		cart_product = create(:cart_product,product_id: product.id)
		cart_product.add_qty(1)
		cart_product.quantity.should == 2
	end
end
