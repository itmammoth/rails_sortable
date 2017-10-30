MIGRATION = Gem::Version.new(Rails.version) < Gem::Version.new(5) ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
class CreateSequencedItems < MIGRATION
  def change
    create_table :sequenced_items do |t|
      t.string :title
      t.integer :sequence

      t.timestamps null: false
    end
  end
end
