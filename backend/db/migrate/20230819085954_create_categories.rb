class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: false do |t|
      t.integer :category_id, null: false, primary_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
