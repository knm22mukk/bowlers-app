class Tweet < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
  
  has_many :tweet_favorites, dependent: :destroy
  has_many :favtweetusers, through: :tweet_favorites, source: :user
end
