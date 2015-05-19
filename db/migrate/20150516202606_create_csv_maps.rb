class CreateCsvMaps < ActiveRecord::Migration
  def change
    create_table :csv_maps do |t|
      t.integer :userid
      t.integer :csvid
      t.text :guid
      t.integer :status

      t.timestamps null: false
    end
  end
end
