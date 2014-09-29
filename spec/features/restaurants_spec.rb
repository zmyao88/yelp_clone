require "rails_helper"

describe "restaurant" do
	context 'Main page' do
		it "has no restaurant" do
			visit '/restaurants'

			expect(page).to have_content('There is no restaurants')
			expect(page).to have_link('Add a restaurant')
		end
	end

end