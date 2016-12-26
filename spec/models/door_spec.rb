require 'rails_helper'

class DoorTest < ActiveSupport::TestCase
	RSpec.describe Door do

		context "when posting required fields" do
			it "Creates a new door" do
				test_door_1 = Door.new(country: "U.S.",
										state: "IL",
										city: "Chicago",
										street: "W. Adams St.",
										street_number: "233",
										zipcode: "54233"
									)
				expect(test_door_1.save).to eq true
			end
		end

		context "when omitting required fields" do
			it "Doesn't save to database when country is omitted" do
				test_door_2 = Door.new(country: "",
										state: "IL",
										city: "Chicago",
										street: "W. Adams St.",
										street_number: "233",
										zipcode: "54233"
									)
				expect(test_door_2.save).to eq false
			end

			it "Doesn't save to database when state is omitted" do
				test_door_3 = Door.new(country: "U.S.",
										state: "",
										city: "Chicago",
										street: "W. Adams St.",
										street_number: "233",
										zipcode: "54233"
									)
				expect(test_door_3.save).to eq false
			end

			it "Doesn't save to database when city is omitted" do
				test_door_4 = Door.new(country: "U.S.",
										state: "IL",
										city: "",
										street: "W. Adams St.",
										street_number: "233",
										zipcode: "54233"
									)
				expect(test_door_4.save).to eq false
			end

			it "Doesn't save to database when street is omitted" do
				test_door_5 = Door.new(country: "U.S.",
										state: "IL",
										city: "Chicago",
										street: "",
										street_number: "233",
										zipcode: "54233"
									)
				expect(test_door_5.save).to eq false
			end

			it "Doesn't save to database when street number is omitted" do
				test_door_6 = Door.new(country: "U.S.",
										state: "IL",
										city: "Chicago",
										street: "W. Adams St.",
										street_number: "",
										zipcode: "54233"
									)
				expect(test_door_6.save).to eq false
			end

			it "Doesn't save to database when zipcode is omitted" do
				test_door_7 = Door.new(country: "U.S.",
										state: "IL",
										city: "Chicago",
										street: "W. Adams St.",
										street_number: "233",
										zipcode: ""
									)
				expect(test_door_7.save).to eq false
			end
		end
		
	end
end
