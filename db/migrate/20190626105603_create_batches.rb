class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.integer :number, null: false

      t.timestamps
    end
  end
end
