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

  		xit "The user can add a restaurant" do
  			visit '/restaurants'

  			click_link 'Add Restaurant'
  			fill_in 'Name', with:

        
  		end
  	end

  end
end