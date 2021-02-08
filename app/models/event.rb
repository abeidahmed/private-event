class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :attendee

  validates :name, :event_date, presence: true

  delegate :name, to: :creator, prefix: true

  scope :past, -> { where('event_date <= ?', Time.zone.now) }
  scope :upcoming, -> { where('event_date > ?', Time.zone.now) }
end
