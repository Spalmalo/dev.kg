FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) { |i| i }
    sequence(:nickname) { Faker::Internet.user_name }
    sequence(:email)    { Faker::Internet.email }
    sequence(:name)     { Faker::Name.name }
    image "http://some/image/url"
  end
end
