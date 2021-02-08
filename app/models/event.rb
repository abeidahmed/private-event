class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  validates :name, :event_date, presence: true
end
