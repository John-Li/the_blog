class RemooveNameFromPosts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
      t.remove :name
  	end
  end
end
