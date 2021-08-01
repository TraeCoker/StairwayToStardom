class CreateBands < ActiveRecord::Migration[6.1]
  def change
    create_table :bands do |t|
      t.string :name 
      t.string :genre 
      t.string :location
      
      t.integer :user_id
      t.integer :reputation
      t.integer :mood
      t.integer :practice_count 
      t.integer :total_shows

      t.integer :vocalist_id 
      t.integer :drummer_id
      t.integer :guitarist_id
      t.integer :bassist_id



      t.timestamps
    end
  end
end
