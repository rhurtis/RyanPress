require 'rails_helper'

RSpec.describe "Articles", type: :request do

  describe "GET /articles" do
    it "responds with a status code of 200" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /articles/new" do
    it "responds with a status code of 200" do
      get new_article_path
      expect(response).to have_http_status(200)
    end 
  end


  describe "GET /articles/:id" do
    context "successfully finds article" do
      it "and responds with a status code of 200" do
        article = create(:article_with_title_and_body)
        get article_url(article)
        expect(response).to have_http_status(200)
      end
    end

    
    context "fails to find an invalid article" do
      it "and responds with a status code of 404" do
        get "/articles/invalid_id"
        expect(response).to have_http_status(404)
      end
    end
  end

 

  describe "POST /articles" do
    context "with valid parameters" do
      it "creates a new article" do
        expect {post articles_url, params: {article: attributes_for(:article_with_title_and_body)}}.to change(Article, :count).by(1)
      end

      it "redirects to the created article" do
        post articles_url, params: {article: attributes_for(:article_with_title_and_body)}
        expect(response).to redirect_to(article_url(Article.last))
      end
    end
  end

end