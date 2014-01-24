class CreateMacs < ActiveRecord::Migration
  def change
    create_table :macs do |t|
      t.string :name
      t.string :mac_address
      t.integer :node_id
      t.timestamps
    end
  end
end
