class Schedule < ApplicationRecord
  has_many :lesson_schedules, dependent: :destroy
  has_many :lessons, :through => :lesson_schedules, dependent: :destroy

  belongs_to :course

  #TO DO: Regex to validate years like 2019/2020
  validates :school_year, presence: true #, format: { with: REGEX, message: 'is not valid. Example: 2021/2022'}
  validates :year, presence: true, :inclusion => { :in => [ '1st', '2nd', '3rd', '4th', '5th' ], :message => "is not one of these: 1st, 2nd, 3rd, 4th or 5th"}
  #TO DO: Regex to validate class like only accept one letter uppercase like A, or B, ...
  validates :schedule_class, presence: true #, format: { with: /\[A-Z]\z/, message: 'is only one uppercase letter. Example: A'}
  validates :version, presence: true
end
