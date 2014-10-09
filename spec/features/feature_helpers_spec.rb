def recreate_sign_in(username,password)
	visit '/restaurants'
	click_link('Sign In')
	fill_in 'Username', with: username
	fill_in 'Password', with: password
	click_button('Log in')
end

def recreate_review(thoughts,rating)
	visit '/restaurants'
	click_link 'Review'
	#save_and_open_page
	      #expect(current_path).to eq("/restaurants/#{@kfc.id}/reviews/new")

	fill_in 'Thoughts',    with: thoughts
	select  rating,        from: 'Rating'
  click_button 'Leave Review'
end

# def recreate_review
#   visit '/restaurants'
#   click_link 'Review'
#   fill_in "Thoughts", with: 'Too fried'
#   select 3, from: 'Rating'
#   click_button 'Leave Review'
# end