class CreateTweetFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_favorites do |t|
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :tweet_id], unique: true
    end
  end
end
