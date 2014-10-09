require 'rails_helper'

describe "Reviews" do

	def fill_review(thoughts,rating)
		click_link 'Review'
		fill_in 'Thoughts', with: thoughts
		select  rating,        from: 'Rating'
    click_button 'Leave Review'
	end
	
	before do
    Restaurant.create(name: 'Nero', description: 'Italian coffee', cuisine: 'Fas Food')
    @byverdu = create :byverdu
    login_as @byverdu
	end

	it "The user can add a review" do
		visit '/restaurants'

		fill_review('Best coffee',3)

    expect(page).to have_content('Best coffee')
    expect(page).to have_content('3')
    expect(current_path).to eq('/restaurants')
	end

	it "with 2 reviews" do
		visit '/restaurants'

		fill_review('Best coffee',3)
		fill_review('Worst coffee',5)

		expect(page).to have_content("Average: ★★★★☆")
	end
end