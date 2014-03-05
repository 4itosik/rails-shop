class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
    	t.belongs_to	:cart
    	t.belongs_to	:order
    	t.belongs_to	:product
    	t.integer			:quantity, default: 0
    	t.integer			:total
      t.timestamps
    end
  end
end
