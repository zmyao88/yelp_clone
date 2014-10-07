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

end