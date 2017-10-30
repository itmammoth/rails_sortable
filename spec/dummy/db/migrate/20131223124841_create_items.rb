class CreateItems < Dummy::MigrationClass
  def change
    create_table :items do |t|
      t.string :title
      t.integer :sort

      t.timestamps null: false
    end
  end
end
