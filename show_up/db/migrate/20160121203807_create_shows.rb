class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.date :date
      t.string :poster_link
      t.integer :venue_id

      t.timestamps null: false
    end
    add_index :shows, :venue_id
  end
end
