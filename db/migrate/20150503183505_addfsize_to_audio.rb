class AddfsizeToAudio < ActiveRecord::Migration
  def change
  	add_column :audios, :fsize, :integer
  end
end
