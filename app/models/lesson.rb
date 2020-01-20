class Lesson < ApplicationRecord
  has_many :lesson_schedules, dependent: :destroy
  has_many :schedules, :through => :lesson_schedules, dependent: :destroy

  belongs_to :space
  belongs_to :discipline
  belongs_to :person

  validates :name, presence: true
end
