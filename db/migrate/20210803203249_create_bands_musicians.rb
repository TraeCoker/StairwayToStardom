class CreateBandsMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :bands_musicians do |t|
      

      t.timestamps
    end
  end
end
