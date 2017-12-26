class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.date :published_at

      t.timestamps
    end
  end
end
