class CreatePostAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :post_attachments do |t|
      t.integer :post_id
      t.string :photo

      t.timestamps
    end
  end
end
