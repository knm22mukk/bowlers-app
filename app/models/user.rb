class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  mount_uploader :image, ImageUploader
  
  validates :introduce, length: { maximum: 255 }
  
  has_many :tweets
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_many :tweet_favorites, dependent: :destroy
  has_many :favtweets, through: :tweet_favorites, source: :tweet
  
  has_many :ball_favorites, dependent: :destroy
  has_many :favballs, through: :ball_favorites, source: :ball
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def feed_tweets
    Tweet.where(user_id: self.following_ids + [self.id])
  end
  
  def favtweet(tweet)
    self.tweet_favorites.find_or_create_by(tweet_id: tweet.id)
  end
  
  def unfavtweet(tweet)
    tweet_favorite = self.tweet_favorites.find_by(tweet_id: tweet.id)
    tweet_favorite.destroy if tweet_favorite
  end
  
  def favtweet?(tweet)
    self.favtweets.include?(tweet)
  end
  
  def favball(ball)
    self.ball_favorites.find_or_create_by(ball_id: ball.id)
  end
  
  def unfavball(ball)
    ball_favorite = self.ball_favorites.find_by(ball_id: ball.id)
    ball_favorite.destroy if ball_favorite
  end
  
  def favball?(ball)
    self.favballs.include?(ball)
  end
end