class ChangePostIdToTripId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :comments, :post_id, :trip_id
  end

  def self.down
  	rename_column :comments, :trip_id, :post_id
  end
end
