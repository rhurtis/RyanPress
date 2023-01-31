FactoryBot.define do
  factory :user do
      factory :user_with_email_and_password do
          email { Faker::Internet.email }
          password { Faker::Internet.password }
      end

      factory :user_without_email do
          password { Faker::Internet.password }
      end

      factory :user_without_password do
          email { Faker::Internet.email }
      end
  end
end