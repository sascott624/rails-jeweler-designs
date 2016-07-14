class RemoveTypeFromDesigns < ActiveRecord::Migration[5.0]
  def change
    remove_column :designs, :type
    add_column :designs, :model, :string
  end
end
