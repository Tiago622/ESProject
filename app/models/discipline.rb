class Discipline < ApplicationRecord
  has_many :lesson, dependent: :destroy
  belongs_to :course

  validates :name, presence: true, length: {minimum: 5}
end
