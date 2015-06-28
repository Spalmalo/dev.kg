FactoryGirl.define do
  factory :article do
    content "# Yep. It is very short asciicast :)\nAwesome!"

    trait :asciicast do
      screencast
    end

    factory :asciicast,  class: Asciicast,  traits: [:asciicast]
  end
end
