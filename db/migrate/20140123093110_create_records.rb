class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :mac_id
      t.integer :downloads
      t.timestamps
    end
  end
end
