class Review < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
	has_many   :endorsements 
  validates  :thoughts, length: {minimum: 1}
  validates  :rating,   inclusion: (1..5)
end
