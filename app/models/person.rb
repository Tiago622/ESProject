class Person < ApplicationRecord
    has_many :reservation, dependent: :destroy
    has_many :lesson, dependent: :destroy
end
