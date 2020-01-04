class Course < ApplicationRecord
  belongs_to :school
  has_many :urls, dependent: :destroy
  has_many :disciplines, dependent: :destroy
  
  validates :name, presence: true, length: {minimum: 5}
end