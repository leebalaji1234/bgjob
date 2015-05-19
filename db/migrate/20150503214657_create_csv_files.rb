class CreateCsvFiles < ActiveRecord::Migration
  def change
    create_table :csv_files do |t|
      t.string :filename
      t.text :flocation
      t.integer :fsize
      t.integer :status

      t.timestamps null: false
    end
  end
end
