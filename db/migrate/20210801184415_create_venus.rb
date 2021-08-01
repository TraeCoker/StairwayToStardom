class CreateVenus < ActiveRecord::Migration[6.1]
  def change
    create_table :venus do |t|

      t.timestamps
    end
  end
end
