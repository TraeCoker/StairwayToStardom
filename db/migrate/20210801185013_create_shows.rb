class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.integer :band_id 
      t.integer :venue_id

      t.timestamps
    end
  end
end
