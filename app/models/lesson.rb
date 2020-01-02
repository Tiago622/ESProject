class Lesson < ApplicationRecord
  belongs_to :space
  belongs_to :person
  belongs_to :discipline
  has_and_belongs_to_many :schedule
end
