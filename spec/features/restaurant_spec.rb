require "rails_helper"

describe "Restaurant" do
  
  context "When user visits the page" do
  	it "for the first time" do
  		visit '/restaurants'

  		expect(page).to have_content('YELP')
  		expect(page).to have_content('There is no restaurants yet')
  		expect(page).to have_link('Add Restaurant')
  	end

  end
end