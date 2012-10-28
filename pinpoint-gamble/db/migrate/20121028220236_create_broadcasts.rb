class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.float :lat
      t.float :lng
      t.float :x
      t.float :y
      t.boolean :inside

      t.timestamps
    end
  end
end
