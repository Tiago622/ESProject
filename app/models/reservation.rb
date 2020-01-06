class Reservation < ApplicationRecord
  belongs_to :person
  belongs_to :space
end
