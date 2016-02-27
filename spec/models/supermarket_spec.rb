require 'rails_helper'

RSpec.describe Supermarket, type: :model do
	describe Supermarket, "Validation" do
	  it "is a valid factory" do
	  	expect(FactoryGirl.create(:supermarket)).to be_valid
	  end

	  it "is invaid without name" do
	  	expect(FactoryGirl.build(:supermarket, name: nil)).to be_invalid
	  end
	end

  describe Supermarket, "Association" do
		before do
			@supermarket = FactoryGirl.create(:supermarket)
			@zipcode = FactoryGirl.build(:zipcode)
			@supermarket.zipcodes << @zipcode
			@supermarket.save
		end

		it "assings supermarket_zipcode was created" do
			expect change{ SupermarketZipcode.count }.by(1)
		end

		it "assings supermarket_zipcode supermarket is correct" do
			expect(SupermarketZipcode.last.supermarket).to eq(@supermarket)
		end

	  it "returns correct zipcodess from supermarket" do
	  	expect(@supermarket.zipcodes).to eq([@zipcode])
	  end
	end
end
