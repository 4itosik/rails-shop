class AddPropertySubcategoryId < ActiveRecord::Migration
  def change
    create_table :properties_subcategories, :id => false, :force => true do |t|
    	t.belongs_to 	:property
    	t.belongs_to	:subcategory
    end
  end
end
