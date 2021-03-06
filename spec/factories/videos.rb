FactoryGirl.define do
  factory :video do
    sequence(:title) { |i| "Учим рельсы #{ i + 1 }" }
    description "Жирафик Рафик сейчас научит вас писать на рельсах."
    sequence(:video_url) { |i| "https://www.youtube.com/watch?v=qpgT_62y5kQ#{i}" }
    type "Clip"
    published_at { Time.now }
    user

    trait :screencast do
      type "Screencast"
    end

    trait :clip do
      type "Clip"
    end

    factory :screencast,  class: Screencast,  traits: [:screencast]
    factory :clip,        class: Clip,        traits: [:clip]
  end
end
