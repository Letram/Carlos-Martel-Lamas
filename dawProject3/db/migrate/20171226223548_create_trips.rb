class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :from
      t.string :where
      t.date :start_date
      t.date :final_date

      t.timestamps
    end
  end
end
