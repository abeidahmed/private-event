FactoryBot.define do
  factory :user do
    sequence(:full_name) { |n| "John Doe #{n}" }
  end
end
