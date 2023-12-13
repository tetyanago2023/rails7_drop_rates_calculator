class ChangeColunmNameInDroprates < ActiveRecord::Migration[7.1]
  def change
    rename_column :droprates, :killed_per_drop, :kills_per_drop
  end
end
