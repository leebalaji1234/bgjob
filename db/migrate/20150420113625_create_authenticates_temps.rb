class CreateAuthenticatesTemps < ActiveRecord::Migration
  def change
    create_table :authenticates_temps do |t|
      t.text :params
      t.integer :status, :limit => 1 # tinyint
      t.text :guid

      t.timestamps null: false
    end
  end
end
