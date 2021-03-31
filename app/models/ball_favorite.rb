class BallFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :ball
end
