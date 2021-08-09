class AddFinalShowForToShows < ActiveRecord::Migration[6.1]
  def change
    add_column :shows, :final_show_for, :string 
  end
end
