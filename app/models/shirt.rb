class Shirt < ApplicationRecord
  belongs_to :batch

  validates :slack_user_id, uniqueness: true, presence: true
end
