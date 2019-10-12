class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :name_sym
      t.text :introduction
      t.decimal :price, precision: 6, scale: 2
      t.integer :position
      t.string :state

      t.timestamps
    end
  end
end
