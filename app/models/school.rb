class School < ApplicationRecord
  has_many :courses, dependent: :destroy
  belongs_to :organic_unit

  validates :name, presence: true, length: {minimum: 5}
  validates :acronym, presence: true, length: {minimum: 1, maximum: 10}, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :address, presence: true
  validates :organic_unit, presence: true
end
