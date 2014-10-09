require 'rails_helper'

require_relative 'feature_helpers_spec'

describe "Reviews" do

	before do
    Restaurant.create(name: 'Nero', description: 'Italian coffee', cuisine: 'Fas Food')
    @byverdu = create :byverdu
    @sulby   = create :sulby

    login_as @byverdu
	end

	it "The user can add a review" do
		visit '/restaurants'

		login_as @byverdu

		recreate_review('Best coffee',3)

    expect(page).to have_content('Best coffee')
    expect(page).to have_content('3')
    expect(current_path).to eq('/restaurants')
	end

	it "with 2 reviews" do
		visit '/restaurants'

		login_as @byverdu
		recreate_review('Best coffee',3)

		logout(:byverdu)

		login_as @sulby

		recreate_review('Worst coffee',5)

		expect(page).to have_content("Average: ★★★★☆")
	end
end

