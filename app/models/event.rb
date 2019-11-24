class Event < ApplicationRecord
  belongs_to :user
  default_scope -> { order(:date) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
