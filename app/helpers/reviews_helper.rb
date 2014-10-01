module ReviewsHelper

	def star_rating rating
		return rating unless rating.respond_to?(:round)

			reminder = (5 - rating.round)

			'★' * rating.round + ('☆' * reminder)
	end

end
