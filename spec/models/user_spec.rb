require 'rails_helper'

RSpec.describe User, type: :model do
    it "is valid with a valid email and password" do
        user = create(:user_with_email_and_password)
        expect(user).to be_valid
    end

    context "is invalid" do
        it "without a valid email" do
            user = build(:user_without_email)
            user.valid?
            expect(user.errors[:email]).to include("can't be blank")
        end

        it "without a password" do
            user = build(:user_without_password)
            user.valid?
            expect(user.errors[:password]).to include("can't be blank")
        end
    end
end