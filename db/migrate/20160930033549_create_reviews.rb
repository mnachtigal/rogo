class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :overall
      t.integer :price
      t.string :comment
      t.references :rental, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
