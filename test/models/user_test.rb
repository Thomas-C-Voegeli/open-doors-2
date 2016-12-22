require 'rails_helper'

class UserTest < ActiveSupport::TestCase

	RSpec.describe User do

		context "when posting required fields" do
			it "Creates a new user" do
				test_user_1 = User.new(email: 'example@fake.com',
															password: "password"
															)
				expect(test_user_1.save).to eq true
			end
		end

		context "when omitting required fields" do
			it "Doesn't save to database when email is omitted" do
				test_user_2 = User.new(email: ""
															password: "password"
															)
				expect(test_user_2.save).to eq false
			end

			it "Doesn't save to database when password is omitted" do
				test_user_3 = User.new(email: "test@test3.com",
															password: ""
															)
				expect(test_user_3.save).to eq false
			end
		end

		context "when saving duplicate data" do
			it "Doesn't save new record to database with duplicate email address" do
				test_user_4 = User.create(
															email: "test@test4.com",
															password: "password"
															)
				test_user_5 = User.create(
															email: "test@test4.com",
															password: "password2"
															)
				expect(test_user_5.save).to eq false
			end
		end
	end
end

