class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
    if @restaurant.reviews.find_by(user_id: current_user.id).nil?
      @review = @restaurant.reviews.new
    else
      flash[:notice] = 'Sorry, you can only review a restaurant once.'
      redirect_to restaurants_path
    end
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(params[:review].permit(:rating, :thoughts))
		@review.user_id = current_user.id
		if @review.save
			redirect_to '/restaurants'
		end
	end
end



# @restaurant = Restaurant.find(params[:restaurant_id])
#     if @restaurant.reviews.find_by(user_id: current_user.id).nil?
#       @review = @restaurant.reviews.new
#     else
#       flash[:notice] = 'Sorry, you can only review a restaurant once.'
#       redirect_to restaurants_path
#     end


		# @restaurant = Restaurant.find(params[:restaurant_id])
		# @review     = Review.new