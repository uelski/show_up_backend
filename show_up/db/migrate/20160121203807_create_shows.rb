class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.date :date
      t.string :poster_link
      t.string :venue_name
      t.integer :venue_id

      t.timestamps null: false
    end
  end
end
