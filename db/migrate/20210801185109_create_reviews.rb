class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :show_id
      t.string :headline
      t.integer :rating

      t.timestamps
    end
  end
end
