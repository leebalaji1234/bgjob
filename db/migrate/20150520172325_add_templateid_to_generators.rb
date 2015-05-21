class AddTemplateidToGenerators < ActiveRecord::Migration
  def change
    add_column :generators, :templateid, :integer
  end
end
