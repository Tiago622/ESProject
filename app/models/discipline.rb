class Discipline < ApplicationRecord
  has_many :lesson, dependent: :destroy
  belongs_to :course
end
