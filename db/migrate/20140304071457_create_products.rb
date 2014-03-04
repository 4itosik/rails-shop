class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string			:name
    	t.integer			:price
    	t.text				:body
    	t.string  		:alias, :unique => true
    	t.belongs_to	:subcategory
      t.timestamps
    end
  end
end
