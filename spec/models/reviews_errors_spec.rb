require "rails_helper"

RSpec.describe Review, :type => :model do

	it "is not valid with a rating less than 1" do
    review = Review.new(rating: '-1')

    expect(review).to have(1).error_on(:rating)
	end

	it "is not valid with a rating more than 5" do
    review = Review.new(rating: '6')

    expect(review).to have(1).error_on(:rating)
	end

	it "is only valid with a rating between 1..5" do
		review = Review.new(rating:4, thoughts: 'Best Chicken')
		expect(review).to be_valid
	end

	it "the thoughts field must be filled" do
	  review = Review.new(rating: '3' ,thoughts: '')

	  expect(review).to have(1).error_on(:thoughts)
	  expect(review).not_to be_valid
	end
end
