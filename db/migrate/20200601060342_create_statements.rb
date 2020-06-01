class CreateStatements < ActiveRecord::Migration[5.2]
  def change
    create_table :statements do |t|
      t.decimal :price, precision: 8, scale: 2
      t.string :content
      t.string :type

      t.timestamps
    end
  end
end
