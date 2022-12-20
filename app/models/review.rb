class Review < ApplicationRecord
  RATING = (0..5).to_a

  belongs_to :restaurant
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: RATING }
end
