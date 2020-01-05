class Lesson < ApplicationRecord
  has_many :lesson_schedules, dependent: :destroy
  has_many :schedules, :through => :lesson_schedules

  belongs_to :discipline
  belongs_to :person
end
