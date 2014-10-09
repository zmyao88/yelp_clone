require "rails_helper"
require_relative "feature_helpers_spec"

describe "User" do

	it "A user can be registered" do
  	
  	visit '/restaurants'

  	click_link('Sign Up')

  	fill_in 'Email',                 with: 'alby@test.io'
  	fill_in 'Username',              with: 'byverdu'
  	fill_in 'Password',              with: 's3cr3tistooshort'
  	fill_in 'Password confirmation', with: 's3cr3tistooshort'

  	click_button('Sign up')

  	expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  context 'sign_in' do

  	before(:each) do
			@byverdu = create(:byverdu)
  	end

	  it "A user can sign in only with his Username" do
      
      recreate_sign_in	  	

	  	expect(page).to have_content('Signed in successfully.')
    end

    it 'can sign out while being logged in' do
    
      login_as @byverdu
      
      visit '/restaurants'
      click_link 'Sign Out'
      
      expect(page).to have_content 'Signed out successfully.'
    end

    it "can edit his profile once is signed in" do
      login_as @byverdu
      
      visit '/restaurants'
      click_link 'Edit Account'
      
      expect(current_path).to eq('/users/edit')
    end
  end

  context "Actions when the user is signed in" do

    before(:each) do
      @kfc     = create(:kfc)
      @byverdu = create(:byverdu)
      @kfc.reviews.create(thoughts:'Worst ever',rating:2)
    end

    it "only a registered user can sign in" do
      visit '/restaurants'

      expect(page).to have_content('Only registered users can add a restaurant')
      click_link('Sign In')
      fill_in 'Username', with: 'byverdu'
      fill_in 'Password', with: 's3cr3tistooshort'

      click_button('Log in')
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_link('Add Restaurant')
    end

    it "only a registered user can leave a review" do
      visit '/restaurants'

      expect(page).not_to have_link('Endorse this review')
      
      recreate_sign_in

      recreate_review

      expect(page).to have_link('Endorse this review')
      expect(page).to have_link('Add Restaurant')
    end

    it "a review belongs to one user" do
      visit '/restaurants'

      recreate_sign_in

      recreate_review

      puts @byverdu.id
      puts @kfc.reviews.last.thoughts

      expect(@kfc.reviews.last.user_id).to eq(@byverdu.id) 
    end
  end
end




















