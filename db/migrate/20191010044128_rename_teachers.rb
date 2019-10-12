class RenameTeachers < ActiveRecord::Migration[5.2]
  def change
    if column_exists? :teachers, :achevements
      rename_column :teachers, :achevements, :achievements
    end
  end
end
