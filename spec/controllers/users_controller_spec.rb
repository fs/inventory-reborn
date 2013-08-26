require 'spec_helper'

describe UsersController do	

	describe "users index" do
		before do
			sign_in FactoryGirl.create(:user)
			FactoryGirl.create(:user, email: "bob@example.com")
			FactoryGirl.create(:user, email: "victor@example.com")
			visit users_path
		end

		it { should have_content('All users')}

		it "should list each user" do
			User.all.each do |user|
				expect(body).to have_content(user.email)
			end	
		end	
	end	
end