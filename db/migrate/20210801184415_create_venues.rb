class CreateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.string :name 
      t.integer :tier 
      t.text :description
      t.string :location 
      t.integer :user_id 

      t.timestamps
    end
  end
end
