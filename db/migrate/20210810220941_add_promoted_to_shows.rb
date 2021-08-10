class AddPromotedToShows < ActiveRecord::Migration[6.1]
  def change
    add_column :shows, :promoted, :boolean, :default => false
  end
end
