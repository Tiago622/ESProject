class Discipline < ApplicationRecord
  has_one :lesson, dependent: :destroy
  belongs_to :course
end
