FactoryGirl.define do
  factory :post do
    sequence(:title) { |i| "Учим рельсы #{ i + 1 }" }
    description "Жирафик Рафик сейчас научит вас писать на рельсах."
    user
  end
end
