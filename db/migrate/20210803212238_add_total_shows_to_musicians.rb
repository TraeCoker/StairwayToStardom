class AddTotalShowsToMusicians < ActiveRecord::Migration[6.1]
  def change
    add_column :musicians, :total_shows, :integer 
  end
end
