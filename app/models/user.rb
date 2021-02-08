class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, dependent: :destroy

  has_many :event_attendances, dependent: :destroy
  has_many :attended_event, foreign_key: :attended_event_id, through: :event_attendances

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
end
