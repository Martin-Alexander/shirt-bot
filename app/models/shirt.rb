class Shirt < ApplicationRecord
  belongs_to :batch

  validates :slack_user_id, uniqueness: true, presence: true

  after_update :check_batch_full

  def check_batch_full
    batch.send_csv if batch.shirts.size == batch.shirts.where.not(size: nil).size
  end
end
