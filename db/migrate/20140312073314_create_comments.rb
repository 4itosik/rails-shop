class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text				:body
    	t.string			:name
    	t.belongs_to	:commentable
      t.string 			:commentable_type
      t.timestamps
    end
  end
end
