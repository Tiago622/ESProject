class Course < ApplicationRecord
  belongs_to :school

  validates :name, presence: true, length: {minimum: 5}
end