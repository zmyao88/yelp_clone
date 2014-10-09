require "rails_helper"


describe "Restaurant" do
  
  context "When user visits the page" do
  	it "for the first time" do
  		visit '/restaurants'

  		expect(page).to have_selector('img[alt=Logo]')
  		expect(page).to have_content('There is no restaurants yet')
  		expect(page).to have_content('Only registered users can add a restaurant')
  	end
  end
	
  context 'Adding a restaurant' do
		before do
      Restaurant.create(name: 'Nero', cuisine: 'Cafe', description: 'Italian coffee')
      @byverdu = create :byverdu
      login_as @byverdu
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

    it "The user will see all the restaurants" do
      visit '/restaurants'

      expect(page).to     have_xpath('//img[@src="/assets/logo.png"]')
      expect(page).to     have_content('Nero')
      expect(page).to     have_content('Cafe')
      expect(page).to     have_content('Italian coffee')
      expect(page).not_to have_content('There is no restaurants yet')
    end

    context 'Submitting invalid information' do

      it "with a name too short" do
        visit '/restaurants'
        
        click_link 'Add Restaurant'
        fill_in 'Name', with: 'Ne'
        click_button 'Create Restaurant'

        expect(page).not_to have_css 'h2', text: 'Ne'
        expect(page).to have_content('error')
      end
    end
  end


  context "Editing restaurants" do
    before do
      Restaurant.create(name: 'Nero', cuisine: 'Cafe', description: 'Italian coffee')
    end

    it "After clicking a link the user can edit a restaurant" do
      visit '/restaurants'

      click_link 'Edit'
      fill_in 'Name',        with: 'Cafe Nero'
      fill_in 'Cuisine',     with: 'CoffeeShop'
      fill_in 'Description', with: 'Cafe italiano'
      click_button 'Update Restaurant'

      expect(page).to have_content('Cafe Nero')
      expect(current_path).to eq('/restaurants')
    end
  end

	context 'Deleting a restaurant' do
		before do
			Restaurant.create(name: 'Nero', description: 'Italian coffee', cuisine: 'Fas Food')
		end

		it "The user can delete a restaurant" do
			visit '/restaurants'

			click_link 'Delete'

			expect(page).to have_content('Nero has been deleted')
			expect(current_path).to eq('/restaurants')
		end
	end

	context 'The user can see a single restaurant' do
		before do
			Restaurant.create(name: 'Nero', description: 'Italian coffee',cuisine: 'CoffeeShop')
		end

		it "After clicking the button the user will see the restaurant" do
			visit '/restaurants'

			click_link 'Show'

			expect(page).to     have_content('Italian coffee')
      expect(current_path).to match(/restaurants\/\d/)
		end
	end
end