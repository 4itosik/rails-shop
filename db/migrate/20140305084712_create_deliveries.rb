class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
    	t.string	:title
    	t.integer	:price
    	t.integer	:price_km
      t.timestamps
    end
  end
end
