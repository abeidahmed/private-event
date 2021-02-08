FactoryBot.define do
  factory :user, aliases: %i[creator] do
    sequence(:name) { |n| "John Doe #{n}" }
  end
end
