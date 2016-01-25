class CreateBandShows < ActiveRecord::Migration
  def change
    create_table :band_shows, :id => false do |t|
      t.integer :band_id
      t.integer :show_id

      t.timestamps null: false
    end
  end
end
