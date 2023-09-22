class ChangeDataStartEndDateToGoal < ActiveRecord::Migration[7.0]
  def up
    remove_column :goals, :start_date, :string
    add_column :goals, :start_date, :datetime
    remove_column :goals, :end_date, :string
    add_column :goals, :end_date, :datetime
  end

  def down
    add_column :goals, :start_date, :string
    remove_column :goals, :start_date, :datetime
    add_column :goals, :end_date, :string
    remove_column :goals, :end_date, :datetime
  end
end
