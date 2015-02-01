FactoryGirl.define do
  factory :impression do
    video
    user

    trait :like do
      type "Like"
    end

    trait :dislike do
      type "Dislike"
    end

    factory :like,    class: Like,    traits: [:like]
    factory :dislike, class: Dislike, traits: [:dislike]
  end
end
