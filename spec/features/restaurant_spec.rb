require "rails_helper"

describe "Restaurant" do
  
  context "When user visits the page" do
  	it "for the first time" do
  		visit '/restaurants'

  		expect(page).to have_content('YELP')
  		expect(page).to have_content('There is no restaurants yet')
  		expect(page).to have_link('Add Restaurant')
  	end

  	context 'When a restaurant has been added' do
  		before do
        Restaurant.create(name: 'Nero', cuisine: 'Cafe', description: 'Italian coffee')
  		end

  		it "The user will see all the restaurants" do
  			visit '/restaurants'

  			expect(page).to     have_content('YELP')
  			expect(page).to     have_content('Nero')
  			expect(page).to     have_content('Cafe')
  			expect(page).to     have_content('Italian coffee')
  			expect(page).not_to have_content('There is no restaurants yet')
  		end

  		it "The user can add a restaurant" do
  			visit '/restaurants'

  			click_link 'Add Restaurant'
  			fill_in 'Name',        with: 'Nero'
  			fill_in 'Cuisine',     with: 'Cafe'
  			fill_in 'Description', with: 'Italian coffee'
  			click_button 'Create Restaurant'

        expect(page).not_to have_content('There is no restaurants yet')
        expect(current_path).to eq('/restaurants')
  		end
  	end

  	context "Editing restaurants" do
  		before do
  			Restaurant.create(name: 'Nero', cuisine: 'Cafe', description: 'Italian coffee')
  		end

  		it "After clicking a link the user can edit a restaurant " do
  			visit '/restaurants'

  			click_link 'Edit Nero'
  			fill_in 'Name',        with: 'Cafe Nero'
  			fill_in 'Cuisine',     with: 'CoffeeShop'
  			fill_in 'Description', with: 'Cafe italiano'
  			click_button 'Update Restaurant'

  			expect(page).to have_content('Cafe Nero')
  			expect(current_path).to eq('/restaurants')
  		end
  	end

  end
end