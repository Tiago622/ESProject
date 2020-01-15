class Discipline < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :destroy
  validates :name, presence: true, length: {minimum: 5}
end
