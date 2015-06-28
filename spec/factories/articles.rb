FactoryGirl.define do
  factory :article do
    content "# Yep. It is very short asciicast :)\nAwesome!"

    trait :asciicast do
      screencast
    end

    trait :post_article do
      post
    end

    factory :asciicast,  class: Asciicast,  traits: [:asciicast]
    factory :post_article,  class: PostArticle,  traits: [:post_article]
  end
end
