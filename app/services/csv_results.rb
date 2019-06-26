require "csv"

module ClassMethods
  def send(options = {})
    batch_number = options.fetch(:batch_number)
    batch = Batch.find_by(number: batch_number) || raise("no batch with nubmer: #{batch_number}")

    csv_file = generate_csv_file(batch)
    send_csv(csv_file, batch)
  end

  private

  def generate_csv_file(batch)
    csv_file_path = Rails.root.join("tmp", "csv_results_#{batch.number}")

    CSV.open(csv_file_path, "w") do |csv_file|
      csv_file << ["slack_username", "gender", "size"]

      batch.shirts.each do |shirt|
        csv_file << [shirt.slack_username, shirt.gender, shirt.size]
      end
    end

    File.open(csv_file_path)
  end

  def send_csv(csv_file, batch)
    SlackClient.files_upload(
      content: csv_file.read,
      channels: batch.issuer_slack_user_id,
      name: "shirts.csv",
      title: "Shirts"
    )
  end
end

class CsvResults
  extend ClassMethods
end