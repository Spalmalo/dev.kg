FactoryGirl.define do
  factory :clip do
    sequence(:title) { |i| "Учим рельсы #{ i + 1 }" }
    description "Жирафик Рафик сейчас научит вас писать на рельсах."
    video_url "https://www.youtube.com/watch?v=qpgT_62y5kQ"
    user
  end
end
