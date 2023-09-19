class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :goal_id, null: false
      t.string :description
      t.string :start_date
      t.string :end_date
      t.integer :create_user_id
      t.timestamps
    end
  end
end
