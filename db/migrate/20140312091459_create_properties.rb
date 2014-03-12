class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.string	:title
    	t.boolean :sort, default: false
      t.timestamps
    end
  end
end
