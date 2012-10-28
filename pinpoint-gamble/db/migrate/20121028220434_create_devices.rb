class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :uuid
      t.string :type
      t.string :os
      t.string :resolution

      t.timestamps
    end
  end
end
