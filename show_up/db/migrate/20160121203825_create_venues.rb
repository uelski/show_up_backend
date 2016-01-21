class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :venue_name
      t.string :address
      t.string :venue_website
      t.timestamps null: false
    end
  end
end
