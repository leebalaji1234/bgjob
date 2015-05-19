class CreateRequestReceivers < ActiveRecord::Migration
  def change
    create_table :request_receivers do |t|
      t.text :ori_params
      t.text :val_params
      t.text :message
      t.integer :code
      t.text :guid
      t.integer :status, :limit => 1 # tinyint

      t.timestamps null: false
    end
  end
end
