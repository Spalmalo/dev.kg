FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) { |i| i }
    sequence(:nickname) { FFaker::Internet.user_name }
    sequence(:email)    { FFaker::Internet.email }
    sequence(:name)     { FFaker::Name.name }
    image "http://some/image/url"
  end
end
