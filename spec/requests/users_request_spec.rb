require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users/new" do
    it "responds with a status code of 200" do
      get new_user_path
      expect(response).to have_http_status(200)
    end 
  end
 

  describe "POST /users" do
    context "with valid parameters" do
      it "creates a new user" do
        expect {post users_url, params: {user: attributes_for(:user_with_email_and_password)}}.to change(User, :count).by(1)
      end

      it "redirects to the home page" do
        post users_url, params: {user: attributes_for(:user_with_email_and_password)}
        expect(response).to redirect_to("/")
      end
    end
  end

end