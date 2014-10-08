require "rails_helper"

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
	  	
	  	visit '/'

	  	click_link('Sign In')
	  	fill_in 'Username', with: 'byverdu'
	  	fill_in 'Password', with: 's3cr3tistooshort'

	  	click_button('Log in')
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
      @byverdu = create :byverdu
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

  end


  


end




















