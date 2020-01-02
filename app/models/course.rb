class Course < ApplicationRecord
  has_many :discipline, dependent: :destroy
  has_many :url, dependent: :destroy
  has_many :schedule, dependent: :destroy
  belongs_to :school
end
