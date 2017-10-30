MIGRATION = Gem::Version.new(Rails.version) < Gem::Version.new(5) ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
class CreateItems < MIGRATION
  def change
    create_table :items do |t|
      t.string :title
      t.integer :sort

      t.timestamps null: false
    end
  end
end
