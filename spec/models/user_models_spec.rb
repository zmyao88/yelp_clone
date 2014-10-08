require 'rails_helper'

RSpec.describe User, :type => :model do

	before do 
		create :byverdu
	end

	it "The user name field must be filled" do
		
		user = User.new(username: '')
		expect(user).to have(1).error_on(:username)
		expect(user).not_to be_valid 
	end

	it "The username must be unique" do
    user = User.new(username: 'byverdu')

		expect(user).to have(1).error_on(:username)
	end
end

