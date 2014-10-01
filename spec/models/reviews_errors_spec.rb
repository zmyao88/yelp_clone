require "rails_helper"

RSpec.describe Review, :type => :model do

	it "is not valid with a rating less than 1" do
    review = Review.new(rating: '0')

    expect(review).to have(1).error_on(:rating)
	end

	it "is not valid with a rating more than 5" do
    review = Review.new(rating: '6')

    expect(review).to have(1).error_on(:rating)
	end




end
