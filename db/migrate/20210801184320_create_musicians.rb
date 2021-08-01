class CreateMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :musicians do |t|
      t.string :name 
      t.integer :band_id
      t.integer :instrument
      t.integer :reputation 
      t.integer :fatigue_level
      t.text :past_bands
      t.text :past_genres

      t.timestamps
    end
  end
end
