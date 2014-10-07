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

	  it "A user can sign in only with his Username" do
			@byverdu = create(:byverdu)
	  	
	  	visit '/users/sign_in'

	  	click_link('Sign In')
	  	fill_in 'Username', with: 'byverdu'
	  	fill_in 'Password', with: 's3cr3tistooshort'

	  	click_button('Log in')

	  	expect(current_path).to eq('/restaurants')
	  	expect(page).to have_content('Signed in successfully.')

	  end
  end


end