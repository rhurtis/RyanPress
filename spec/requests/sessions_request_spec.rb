require 'rails_helper'

RSpec.describe "Session", type: :request do

    describe  'POST /sessions' do
        it "takes correct user credentials and creates a session" do
            test_user = User.create(email: "ryan@example.com", password: "123456")

            post "/sessions", :params => {email: "ryan@example.com" , password: "123456"}

            expect(session[:user_id]).to eq(test_user.id)
        end
    end

end