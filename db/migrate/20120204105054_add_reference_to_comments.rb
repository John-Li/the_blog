class AddReferenceToComments < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
    	t.references :post
  	end

  	add_index :comments, :post_id
  end
end

