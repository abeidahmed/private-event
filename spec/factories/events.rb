FactoryBot.define do
  factory :event, aliases: %i[attended_event] do
    creator
    name { 'hello world' }
    event_date { Time.zone.now }
    description { 'hello world description' }

    trait :past do
      event_date { Time.zone.now - 2.hours }
    end

    trait :upcoming do
      event_date { Time.zone.now + 2.hours }
    end
  end
end
