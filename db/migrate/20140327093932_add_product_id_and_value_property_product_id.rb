class AddProductIdAndValuePropertyProductId < ActiveRecord::Migration
  def change
    create_table :products_value_property_products, :id => false, :force => true do |t|
    	t.belongs_to 	:product
    	t.belongs_to	:value_property_product
    end
  end
end
