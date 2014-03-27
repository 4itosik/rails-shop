class CreateValuePropertyProducts < ActiveRecord::Migration
  def change
    create_table :value_property_products do |t|
    	t.string			:value
    	t.belongs_to	:property
      t.timestamps
    end
  end
end
