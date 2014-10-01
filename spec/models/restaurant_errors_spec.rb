require "rails_helper"

RSpec.describe Restaurant, :type => :model do

	it "Model: No valid with a name of less than 3 characters" do
		
		restaurant = Restaurant.new(name: 'kf')

		expect(restaurant).to have(1).error_on(:name)
		expect(restaurant).not_to be_valid
	end

	it	"has to   have unique name" do
			Restaurant.create(name: 'KFC')
			restaurant = Restaurant.new(name:'KFC')

			expect(restaurant).to have(1).error_on(:name)
	end

end