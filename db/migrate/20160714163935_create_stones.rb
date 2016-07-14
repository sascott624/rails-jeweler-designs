class CreateStones < ActiveRecord::Migration[5.0]
  def change
    create_table :stones do |t|
      t.string :name
      t.integer :weight
      t.integer :cost
    end
  end
end
