class StreakHistory < ApplicationRecord
  belongs_to :user
  
  validates :streak, presence: true
  validates :recorded_at, presence: true
end
