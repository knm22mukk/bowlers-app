class CreateBalls < ActiveRecord::Migration[5.2]
  def change
    create_table :balls do |t|
      t.string :name
      t.string :brand
      t.integer :cost
      t.string :content
      t.datetime :release_date
      t.string :image
      t.string :memo

      t.timestamps
    end
  end
end
