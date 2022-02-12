require 'rails_helper'

RSpec.describe Article, type: :model do
    it "is valid with a title and body" do
        article = Article.create(title:"Test Title", body: "Test Body")
        expect(article).to be_valid
    end

    context "is invalid" do
        it "without a title" do
            article = Article.create(body: "Test Body")
            expect(article).to_not be_valid
        end

        it "without a body" do
            article = Article.create(title: "Test Title")
            expect(article).to_not be_valid
        end
    end

    it "has a unique title" do
        Article.create(title: "article1", body: "article1")

        article2 = Article.new(title: "article1", body: "article2")

        article2.valid?

        expect(article2.errors[:title]).to include("has already been taken")
    end

end