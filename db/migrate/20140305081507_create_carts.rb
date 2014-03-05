class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.integer	 :total, default: 0
      t.timestamps
    end
  end
end
