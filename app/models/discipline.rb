class Discipline < ApplicationRecord
  belongs_to :course

  validates :name, presence: true, length: {minimum: 5}
end
