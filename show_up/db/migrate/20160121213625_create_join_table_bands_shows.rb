class CreateJoinTableBandsShows < ActiveRecord::Migration
  def change
    create_table :bands_shows, id: false do |t|
      t.integer :band_id
      t.integer :show_id
    end
    add_index :bands_shows, :band_id
    add_index :bands_shows, :show_id
  end
end
