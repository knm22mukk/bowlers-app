class Ball < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
  
  has_many :ball_favorites, dependent: :destroy
  has_many :favballusers, through: :ball_favorites, source: :user
end