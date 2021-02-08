class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, dependent: :destroy

  has_many :event_attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendances, source: :attended_event

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

  def upcoming_events
    attended_events.where('event_date > ?', Time.zone.now)
  end

  def previous_events
    attended_events.where('event_date <= ?', Time.zone.now)
  end
end
