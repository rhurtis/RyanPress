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
end