class Batch < ApplicationRecord
  has_many :shirts

  validates :number, presence: true, uniqueness: true
end
