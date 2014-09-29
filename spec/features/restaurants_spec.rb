require "rails_helper"

describe "Restaurant" do
	context 'Main page' do
		it "has no restaurant" do
			visit '/restaurants'

			expect(page).to have_content('There is no restaurants')
			expect(page).to have_link('Add restaurant')
		end
	end

	context "Adding a restaurant" do
		before do
		  Restaurant.create(name: 'Alby')
		end

		it "displays the restaurants" do
			visit '/restaurants'

			expect(page).to     have_content('Alby')
			expect(page).not_to have_content('There is no restaurants')
		end

		it "can add a restaurant" do
		  visit '/restaurants'

		  click_link 'Add restaurant'

			fill_in 'Name', with: 'Alby' 			
			click_button 'Create Restaurant'
			expect(page).to have_content('Alby')
			expect(current_path).to eq '/restaurants'
		end
	end

end