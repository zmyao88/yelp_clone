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
      Restaurant.create(name: 'Nero', description: 'The best coffee')
    end

		it "User sees a list of all restaurants" do
			visit '/restaurants'

			expect(page).to have_content('Nero')
			expect(page).to have_content('The best coffee')
			expect(page).not_to have_content("There is no Restaurants")
		end

		it "User adds a restaurant" do
			visit '/restaurants'

			click_link 'Add Restaurant'
			fill_in 'Name'       , with: "Nero"
			fill_in 'Description', with: "The best coffee"
			click_button 'Create Restaurant'

			expect(page).to have_content('Nero')
			expect(page).to have_content('The best coffee')
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
			fill_in 'Name',        with: 'Cafe Nero'
			fill_in 'Description', with: "The worst coffee"
			click_button 'Update Restaurant'

			expect(page).to have_content('Cafe Nero')
			expect(page).to have_content('The worst coffee')
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

















