class School < ApplicationRecord
  has_many :course, dependent: :destroy
  belongs_to :organic_unit
end
