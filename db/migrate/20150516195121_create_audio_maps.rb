class CreateAudioMaps < ActiveRecord::Migration
  def change
    create_table :audio_maps do |t|
      t.integer :userid
      t.integer :audioid
      t.text :guid
      t.integer :cliporder
      t.integer :status

      t.timestamps null: false
    end
  end
end
