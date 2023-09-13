class DropPostImages < ActiveRecord::Migration[7.0]
  def change
    drop_table :goal_images do |t|
      t.integer :goal_id
      t.string :image

      t.timestamps
    end
  end
end
