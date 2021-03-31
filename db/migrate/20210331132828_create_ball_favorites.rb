class CreateBallFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :ball_favorites do |t|
      t.references :user, foreign_key: true
      t.references :ball, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :ball_id], unique: true
    end
  end
end
