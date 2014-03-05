class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string			:name
    	t.integer			:product_price
    	t.integer			:delivery_price
    	t.integer			:total
    	t.belongs_to	:delivery	
      t.timestamps
    end
  end
end
