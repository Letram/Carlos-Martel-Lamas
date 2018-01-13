class CreateTripAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_attachments do |t|
      t.integer :trip_id
      t.string :photo

      t.timestamps
    end
  end
end
