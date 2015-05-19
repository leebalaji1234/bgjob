class CreateAudioTemps < ActiveRecord::Migration
  def change
    create_table :audio_temps do |t|
      t.string :audioname
      t.text :flocation
      t.integer :fsize
      t.text :ftlocation
      t.integer :status

      t.timestamps null: false
    end
  end
end
