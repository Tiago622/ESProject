class OrganicUnit < ApplicationRecord
    has_many :school, dependent: :destroy 
end
