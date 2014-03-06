require 'spec_helper'

describe Cart do
  it "test price_total" do
		product1 = create(:product, price: 1)
		product2 = create(:product, price: 2)
		cart = create(:cart)
		cart_product1 = create(:cart_product,product_id: product1.id, cart_id: cart.id)
		cart_product2 = create(:cart_product, product_id: product2.id, cart_id: cart.id)
		cart.price_total
		cart.total.should == (product1.price + product2.price)
	end
end
