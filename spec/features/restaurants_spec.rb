require "rails_helper"

describe "Restaurant" do
	context 'When visiting the page for first time' do
		it "There is no restaurants" do
			visit '/restaurants'

			expect(page).to have_content('YELP')
			expect(page).to have_content('There is no Restaurants')
			expect(page).to have_content('Add Restaurant')
		end
	end

	context "adding a restaurant" do
    before do
      Restaurant.create(name: 'Nero')
    end

		it "Shows a list of all restaurants" do
			visit '/restaurants'

			expect(page).to have_content('Nero')
			expect(page).not_to have_content("There is no Restaurants")
		end
	end

end

















