class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.date :birthday
      t.text :introduction
      t.text :achevements

      t.timestamps
    end
  end
end
