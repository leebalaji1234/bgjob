class CreateRequestReceiverTemps < ActiveRecord::Migration
  def change
    create_table :request_receiver_temps do |t|
      t.text :params
      t.integer :status, :limit => 1 #tinyint

      t.timestamps null: false
    end
  end
end
