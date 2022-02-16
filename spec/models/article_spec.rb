require 'rails_helper'

RSpec.describe Article, type: :model do
    it "is valid with a title and body" do
        article = create(:article_with_title_and_body)
        expect(article).to be_valid
    end

    context "is invalid" do
        it "without a title" do
            article = build(:article_without_title)
            article.valid?
            expect(article.errors[:title]).to include("can't be blank")
        end

        it "without a body" do
            article = build(:article_without_body)
            article.valid?
            expect(article.errors[:body]).to include("can't be blank")
        end
    end

    it "has a unique title" do
        Article.create(title: "article1", body: "article1")

        article2 = Article.new(title: "article1", body: "article2")

        article2.valid?

        expect(article2.errors[:title]).to include("has already been taken")
    end

end