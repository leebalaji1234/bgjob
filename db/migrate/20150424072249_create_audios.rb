class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :audioname
      t.text :flocation
      t.integer :status, limit: 1

      t.timestamps null: false
    end
  end
end
