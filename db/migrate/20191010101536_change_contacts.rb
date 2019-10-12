class ChangeContacts < ActiveRecord::Migration[5.2]
  def change
    if column_exists? :contacts, :email
      remove_column :contacts, :email
    end

    unless column_exists? :contacts, :name
      add_column :contacts, :name, :string
    end

    unless column_exists? :contacts, :grade
      add_column :contacts, :grade, :string
    end

    unless column_exists? :contacts, :state
      add_column :contacts, :state, :string, default: :new
    end
  end
end
