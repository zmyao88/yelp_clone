require 'rails_helper'

describe "Reviews" do
	
	before do
    Restaurant.create(name: 'Nero')
	end

	it "The user can add a review" do
		visit '/restaurants'

		click_link 'Review Nero'
		fill_in 'Thoughts', with: 'Best coffee'
		select  '3',        from: 'Rating'
    click_button 'Leave Review'

    expect(page).to have_content('Best coffee')
    expect(page).to have_content('3')
    expect(current_path).to eq('/restaurants')
	end

end