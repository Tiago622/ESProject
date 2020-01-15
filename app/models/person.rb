class Person < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :reservations, dependent: :destroy
    has_many :lessons, dependent: :destroy
    # TO DO: validate name, phone, extension, email, cabinet, job_title_1, job_title_2, job_title_3
    validates :name, presence: true, length: {minimum: 5}
    # validates :phone, length:{minimum: 9, maximum: 16}
end
