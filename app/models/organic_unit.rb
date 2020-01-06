class OrganicUnit < ApplicationRecord
    has_many :schools, dependent: :destroy
    
    validates :name, presence: true, length: {minimum: 5}
    validates :acronym, presence: true, length: {minimum: 1, maximum: 10}, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
