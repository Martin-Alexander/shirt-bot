class CreateShirts < ActiveRecord::Migration[5.2]
  def change
    create_table :shirts do |t|
      t.string :size
      t.string :gender
      t.references :batch, foreign_key: true
      t.string :slack_username, null: false
      t.string :slack_uuid, null: false

      t.timestamps
    end
  end
end
