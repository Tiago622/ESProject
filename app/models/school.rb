class School < ApplicationRecord
  has_one :course, dependent: :destroy
  belongs_to :organic_unit
end
