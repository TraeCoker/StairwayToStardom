class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.integer :band_id 
      t.intger :venue_id

      t.timestamps
    end
  end
end
