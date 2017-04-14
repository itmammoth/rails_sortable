class CreateOtherItems < ActiveRecord::Migration
  def change
    create_table :other_items do |t|
      t.string :title
      t.integer :sequence

      t.timestamps
    end
  end
end
