class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.integer :user_id
      t.integer :stone_id
      t.string :metal
      t.integer :price
      t.string :type
    end
  end
end
