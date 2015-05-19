class CreateGenerators < ActiveRecord::Migration
  def change
    create_table :generators do |t|
      t.integer :userid
      t.text :guid
      t.text :csvfile
      t.string :csvcount
      t.string :processedcount
      t.integer :status

      t.timestamps null: false
    end
  end
end
