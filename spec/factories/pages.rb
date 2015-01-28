FactoryGirl.define do
  factory :page do
    sequence(:title) { |i| "Страница #{ i + 1 }" }
    content "<p>Крутотенечка!</p>"
  end
end
