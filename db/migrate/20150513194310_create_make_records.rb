class CreateMakeRecords < ActiveRecord::Migration
  def change
    create_table :make_records do |t|
      t.string :guid
      t.integer :userid
      t.string :callerid
      t.string :source
      t.string :destination
      t.integer :templateid
      t.integer :dialedtime
      t.integer :answeredtime
      t.integer :endtime
      t.string :dialstatus
      t.string :reason

      t.timestamps null: false
    end
  end
end
