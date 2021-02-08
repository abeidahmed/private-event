class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_attendances, dependent: :destroy
  has_many :attendees, foreign_key: :attendee_id, through: :event_attendances

  validates :name, :event_date, presence: true

  delegate :name, to: :creator, prefix: true
end
