class Url < ApplicationRecord
  belongs_to :course

  validates :url, presence: true, length: {minimum: 10}
end
