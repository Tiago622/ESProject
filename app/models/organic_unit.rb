class OrganicUnit < ApplicationRecord
    has_one :school, dependent: :destroy 
end
