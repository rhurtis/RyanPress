require 'rails_helper'

RSpec.describe "Session", type: :request do

    describe  'POST /sessions' do
        context "with valid parameters" do
            it "creates a session and redirects to the home page" do
                test_user = User.create(email: "ryan@example.com", password: "123456")
    
                post "/sessions", :params => {email: "ryan@example.com" , password: "123456"}
    
                expect(session[:user_id]).to eq(test_user.id)
                expect(response).to redirect_to "/"
            end
        end
        
        context "with invalid parameters" do
            it "re-renders the sessions new template and shows an error message" do
                post "/sessions", :params => {email: "ryan@example.com" , password: "123456"}
    
                expect(session[:user_id]).to eq(nil)
                expect(response).to redirect_to "/sessions/new"

                follow_redirect!

                expect(response.body).to include("Incorrect Credentials: Please Try Again")
            end
        end
    end

    

    describe "GET /sessions/new" do
        it "renders the login page and responds with a status code of 200" do
            get "/sessions/new"
            expect(response).to have_http_status(200)
            expect(response.body).to include("Login Page")
        end 
    end

end