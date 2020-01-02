class Course < ApplicationRecord
  has_one :discipline, dependent: :destroy
  has_one :url, dependent: :destroy
  has_one :schedule, dependent: :destroy
  belongs_to :school
end
