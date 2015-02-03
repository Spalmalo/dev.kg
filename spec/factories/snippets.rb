FactoryGirl.define do
  factory :snippet do
    video
    file "config/initializers/assets.rb"
    language "ruby"
    code "Rails.application.config.assets.initialize_on_precompile = false"
  end
end
