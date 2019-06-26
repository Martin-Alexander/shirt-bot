class Batch < ApplicationRecord
  has_many :shirts, dependent: :destroy

  validates :number, presence: true, uniqueness: true
  validates :issuer_slack_user_id, presence: true

  def send_csv
    CsvResults.send(batch_number: number)
  end
end
