class CreateMultipleClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :first_items do |t|
      t.string :title
      t.integer :sort

      t.timestamps null: false
    end
    create_table :second_items do |t|
      t.string :title
      t.integer :sort

      t.timestamps null: false
    end
  end
end
