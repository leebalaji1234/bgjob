class CreateCallTemplates < ActiveRecord::Migration
  def change
    create_table :call_templates do |t|
      t.string :name
      t.string :desc
      t.text :flocation
      t.integer :mode

      t.timestamps null: false
    end
  end
end
