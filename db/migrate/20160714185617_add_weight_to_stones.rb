class AddWeightToStones < ActiveRecord::Migration[5.0]
  def change
    remove_column :stones, :weight
    add_column :stones, :weight, :float
  end
end
