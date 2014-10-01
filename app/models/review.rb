class Review < ActiveRecord::Base
	belongs_to :restaurant 
  validates  :thoughts, length: {minimum: 1}
  validates  :rating,   inclusion: (1..5)
end
