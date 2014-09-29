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
		  Restaurant.create(name: 'Nero')
		end

		it "displays the restaurants" do
			visit '/restaurants'

			expect(page).to     have_content('Nero')
			expect(page).not_to have_content('There is no restaurants')
		end

		it "can add a restaurant" do
		  visit '/restaurants'

		  click_link 'Add restaurant'

			fill_in 'Name', with: 'Nero' 			
			click_button 'Create Restaurant'
			
			expect(page).to have_content('Nero')
			expect(current_path).to eq '/restaurants'
		end
	end

	context 'Editing the restaurants' do
		before do
		  Restaurant.create(name: 'Nero')
		end

		it "the user can edit restaurants info" do
			visit '/restaurants'

			click_link 'Edit Nero'
			fill_in 'Name', with: 'Cafe Nero'
			click_button 'Update Restaurant'

			expect(page).to     have_content('Cafe Nero')
			expect(current_path).to eq '/restaurants'

		end
	end

end