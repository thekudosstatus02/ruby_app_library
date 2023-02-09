class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :price
      t.integer :isbn
      t.integer :year
      t.string :publisher

      t.timestamps
    end
  end
end
