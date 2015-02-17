class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.date :photo_date
      t.string :photo_title
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :photos, :users
  end
end
