module ReviewsHelper

	def star_rating rating
		return rating unless rating.is_a?(Fixnum)

		if rating <= 5

			reminder = (5 - rating)

			('★' * rating) + ('☆' * reminder)
		end
	end

end
