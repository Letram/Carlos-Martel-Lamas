class AddTripIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :trip_id, :integer
  end
end
