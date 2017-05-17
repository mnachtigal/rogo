class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.boolean :default
      t.references :rental, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
