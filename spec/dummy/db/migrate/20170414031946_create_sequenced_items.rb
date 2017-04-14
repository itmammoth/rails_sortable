class CreateSequencedItems < ActiveRecord::Migration
  def change
    create_table :sequenced_items do |t|
      t.string :title
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
