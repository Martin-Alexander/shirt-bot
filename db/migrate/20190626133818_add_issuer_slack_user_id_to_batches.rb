class AddIssuerSlackUserIdToBatches < ActiveRecord::Migration[5.2]
  def change
    add_column :batches, :issuer_slack_user_id, :string
  end
end
