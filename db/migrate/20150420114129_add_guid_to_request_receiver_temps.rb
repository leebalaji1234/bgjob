class AddGuidToRequestReceiverTemps < ActiveRecord::Migration
  def change
    add_column :request_receiver_temps, :guid, :text
  end
end
