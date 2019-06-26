class RemoveConstraintFromShirt < ActiveRecord::Migration[5.2]
  def change
    change_column :shirts, :slack_username, :string, null: true
  end
end
