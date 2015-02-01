FactoryGirl.define do
  factory :clip do
    sequence(:title) { |i| "Учим рельсы #{ i + 1 }" }
    description "Жирафик Рафик сейчас научит вас писать на рельсах."
    sequence(:video_url) { |i| "https://www.youtube.com/watch?v=qpgT_62y5kQ#{i}" }
    user
  end
end
