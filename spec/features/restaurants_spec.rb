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

	context "Adding a restaurant" do
    before do
      Restaurant.create(name: 'Nero')
    end

		it "User sees a list of all restaurants" do
			visit '/restaurants'

			expect(page).to have_content('Nero')
			expect(page).not_to have_content("There is no Restaurants")
		end

		it "User adds a restaurant" do
			visit '/restaurants'

			click_link 'Add Restaurant'
			fill_in 'Name', with: "Nero"
			click_button 'Create Restaurant'

			expect(page).to have_content('Nero')
			expect(current_path).to eq('/restaurants')
		end
	end

	context 'Editing a restaurant' do
		before do
			Restaurant.create(name: 'Nero')
		end

		it "after clicking the link the user can edit the restaurant" do
			
			visit '/restaurants'

			click_link 'Edit Nero'
			fill_in 'Name', with: 'Cafe Nero'
			click_button 'Update Restaurant'

			expect(page).to have_content('Cafe Nero')
			expect(current_path).to eq('/restaurants')
		end
	end

	context 'Deleting a restaurant' do
		before do
		  Restaurant.create(name: 'Nero')
		end

		it "after clicking the link the restaurant is deleted" do
			visit '/restaurants'

			click_link 'Delete Nero'

			expect(page).to have_content('Nero has been deleted')
			expect(current_path).to eq('/restaurants') 
		end
	end

end

















