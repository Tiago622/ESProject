class Space < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :reservations, dependent: :destroy
end
