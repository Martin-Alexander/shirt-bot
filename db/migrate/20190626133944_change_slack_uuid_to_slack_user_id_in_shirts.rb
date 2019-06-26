class ChangeSlackUuidToSlackUserIdInShirts < ActiveRecord::Migration[5.2]
  def change
    rename_column :shirts, :slack_uuid, :slack_user_id
  end
end
