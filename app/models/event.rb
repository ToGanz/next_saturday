class Event < ApplicationRecord
  belongs_to :user
  has_many :event_attendances, dependent: :destroy
  has_many :event_attendees, through: :event_attendances, source: :user
  default_scope -> { order(:date) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
