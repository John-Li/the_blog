class AddReferenceToPosts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.references :category
  	end
  end
end
