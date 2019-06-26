class Shirt < ApplicationRecord
  belongs_to :batch

  validates :slack_uuid, uniqueness: true, presence: true
  validates :slack_username, presence: true
end
