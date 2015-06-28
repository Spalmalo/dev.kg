FactoryGirl.define do
  factory :post do
    sequence(:title) { |i| "Учим рельсы #{ i + 1 }" }
    description "Жирафик Рафик сейчас научит вас писать на рельсах."
    user
    post_article_attributes do |post|
      attributes_for :post_article, post: post
    end
  end
end
