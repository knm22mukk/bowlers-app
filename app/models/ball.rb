class Ball < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
end