class OrganicUnit < ApplicationRecord
    has_many :schools, dependent: :destroy 
end
