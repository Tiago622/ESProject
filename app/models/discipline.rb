class Discipline < ApplicationRecord
  has_many :lesson, dependent: :destroy
  belongs_to :course
  has_many :lessons, dependent: :destroy
  validates :name, presence: true, length: {minimum: 5}
end
