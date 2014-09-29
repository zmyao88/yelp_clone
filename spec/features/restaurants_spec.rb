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

end

















