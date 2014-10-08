require 'rails_helper'

RSpec.describe User, :type => :model do

	it "The user name field must be filled" do
		
		user = User.new(username: '')
		expect(user).to have(1).error_on(:username)
		expect(user).not_to be_valid 
	end
end
