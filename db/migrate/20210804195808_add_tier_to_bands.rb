class AddTierToBands < ActiveRecord::Migration[6.1]
  def change
    add_column :bands, :tier, :integer 
  end
end
