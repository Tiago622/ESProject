class Schedule < ApplicationRecord
  has_many :lesson_schedules, dependent: :destroy
  has_many :lessons, :through => :lesson_schedules, dependent: :destroy

  belongs_to :course

  #TO DO: Regex to validate years like 2019/2020
  validates :name, presence: true
  validates :school_year, presence: true #, format: { with: REGEX, message: 'is not valid. Example: 2021/2022'}
  validates :year, presence: true, :inclusion => { :in => [ '1', '2', '3', '4', '5' ], :message => "is not one of these: 1, 2, 3, 4 or 5"}
  #TO DO: Regex to validate class like only accept one letter uppercase like A, or B, ...
  validates :schedule_class, presence: true #, format: { with: /\[A-Z]\z/, message: 'is only one uppercase letter. Example: A'}
  validates :version, presence: true
end
