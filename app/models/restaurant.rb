class Restaurant < ActiveRecord::Base
	has_many  :reviews,     dependent: :destroy
	validates :name,        length: {minimum:3}, uniqueness: true
	validates :description, length: {minimum:1}
	validates :cuisine,     length: {minimum:1}    

	def average_rating 
		return "N/A" if reviews.none?

		reviews.inject(0){ |memo, review| memo + review.rating } / reviews.length
	end
end
