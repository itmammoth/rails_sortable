class CreateSequencedItems < Dummy::MigrationClass
  def change
    create_table :sequenced_items do |t|
      t.string :title
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
