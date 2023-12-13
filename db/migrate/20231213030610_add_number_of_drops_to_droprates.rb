class AddNumberOfDropsToDroprates < ActiveRecord::Migration[7.1]
  def change
    add_column :droprates, :number_of_drops, :integer
  end
end
