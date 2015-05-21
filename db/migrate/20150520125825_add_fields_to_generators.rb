class AddFieldsToGenerators < ActiveRecord::Migration
  def change
    add_column :generators, :csvstatus, :integer
    add_column :generators, :audiostatus, :integer
    add_column :generators, :audiocollection, :text
  end
end
