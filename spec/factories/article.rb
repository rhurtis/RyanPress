FactoryBot.define do
    factory :article do
        factory :article_with_title_and_body do
            title { Faker::Book.title }
            body { Faker::Lorem.paragraph }
        end

        factory :article_without_title do
            body { Faker::Lorem.paragraph }
        end

        factory :article_without_body do
            title { Faker::Book.title }
        end
    end
end