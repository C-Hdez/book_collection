class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.decimal :price
      t.datetime :publish

      t.timestamps
    end
  end
end
