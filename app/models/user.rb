class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
end
