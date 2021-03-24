class CreateMagazines < ActiveRecord::Migration[6.1]
  def change
    create_table :magazines do |t|
      t.string :title
      t.string :isbn
      t.references :author, null: false, foreign_key: true
      t.date :published_at

      t.timestamps
    end
  end
end
