def recreate_sign_in
	visit '/'
	click_link('Sign In')
	fill_in 'Username', with: 'byverdu'
	fill_in 'Password', with: 's3cr3tistooshort'
	click_button('Log in')
end

def recreate_review
  visit '/restaurants'
  click_link 'Review'
  fill_in "Thoughts", with: 'Too fried'
  select 3, from: 'Rating'
  click_button 'Leave Review'
end