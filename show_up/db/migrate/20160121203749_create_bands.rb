class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :band_name
      t.string :email
      t.string :password_digest
      t.string :band_website
      t.string :photo_link

      t.timestamps null: false
    end
  end
end
