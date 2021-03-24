class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.references :author, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
