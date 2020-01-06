class Course < ApplicationRecord
  belongs_to :school
  has_many :urls, dependent: :destroy
  has_many :disciplines, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :name, presence: true, length: {minimum: 5}
end
