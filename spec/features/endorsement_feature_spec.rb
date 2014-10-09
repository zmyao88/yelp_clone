require "rails_helper"
require_relative "feature_helpers_spec"

describe "Endorsing reviews" do
  before do
    kfc = Restaurant.create(name: 'KFC',description: 'Kentucky Fried Chicken', cuisine: 'Fast Food' )
    kfc.reviews.create(thoughts:'Worst ever',rating:2)

    @byverdu = create :byverdu
    login_as @byverdu

    recreate_review('Worst ever',2)
  end

	it "I can endorse a review updating the review count", js: true do
		visit '/restaurants'

		first('.review_endorsement').click

		expect(page).to have_content('0 endorsement')
	end

	
end
