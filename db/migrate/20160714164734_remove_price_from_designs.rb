class RemovePriceFromDesigns < ActiveRecord::Migration[5.0]
  def change
    remove_column :designs, :price
  end
end
