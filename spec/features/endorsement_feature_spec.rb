require "rails_helper"

describe "Endorsing reviews" do
  before do
    kfc = Restaurant.create(name: 'KFC',description: 'Kentucky Fried Chicken', cuisine: 'Fast Food' )
    kfc.reviews.create(thoughts:'Worst ever',rating:2)
  end

	it "I can endorse a review updating the review count" do
		visit '/restaurants'

		click_link 'Endorse this review'

		expect(page).to have_content('1 endorsement')
	end
end