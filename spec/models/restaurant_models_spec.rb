require "rails_helper"

RSpec.describe Restaurant, :type => :model do

	it "Model: No valid with a name of less than 3 characters" do
		
		restaurant = Restaurant.new(name: 'kf')

		expect(restaurant).to have(1).error_on(:name)
		expect(restaurant).not_to be_valid
	end

	it	"has to be unique name" do
			Restaurant.create(name: 'KFC', description: 'Chicken', cuisine: 'Fas Food')
			restaurant = Restaurant.create(name:'KFC')

			expect(restaurant).to have(1).error_on(:name)
	end

	it "the description field must be filled" do
		restaurant = Restaurant.new(description: '')

		expect(restaurant).to have(1).error_on(:description)
		expect(restaurant).not_to be_valid
	end

	it "the cuisine field must be filled" do
		restaurant = Restaurant.new(cuisine: '')

		expect(restaurant).to have(1).error_on(:cuisine)
		expect(restaurant).not_to be_valid
	end

	describe "#average_rating" do
    
		it "with no reviews" do
			restaurant = Restaurant.create(name:'KFC')
			expect(restaurant.average_rating).to eq('N/A')
		end

		it "with 1 reviews" do
		  restaurant = Restaurant.create(name:'KFC')
		  restaurant.reviews.new(rating: 4)

		  expect(restaurant.average_rating).to eq(4)end

		it "with 2 reviews" do
			restaurant = Restaurant.create(name:'KFC')
		  restaurant.reviews.new(rating: 3)
		  restaurant.reviews.new(rating: 5)

		  expect(restaurant.average_rating).to eq(4)
		end
	end
end