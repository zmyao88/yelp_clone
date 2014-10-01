class Review < ActiveRecord::Base
	belongs_to :restaurant 
  validates  :rating,   inclusion: (1..5)
  validates  :thoughts, length: {minimum: 1}
end
