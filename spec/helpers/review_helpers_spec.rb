require "rails_helper"

describe ReviewsHelper, :type => :helper do

	context '#star_rating' do
		it 'does nothing for not a number' do
		  expect(helper.star_rating('N/A')).to eq('N/A')
		end

		it "returns 5 black stars for 5" do
			expect(helper.star_rating(5)).to eq("★★★★★")
		end
	
		it "returns 4 black stars and 1 empty stars" do
			expect(helper.star_rating(4)).to eq("★★★★☆")
		end

		it "returns 2 black stars 3 empty stars" do
			expect(helper.star_rating(2)).to eq("★★☆☆☆")
		end

		it "returns 5 empty stars" do
			expect(helper.star_rating(0)).to eq("☆☆☆☆☆")
		end

		it "rounds to the nearest star for a non whole numbers" do
			expect(helper.star_rating(2.6)).to eq("★★★☆☆")
		end
	end
end