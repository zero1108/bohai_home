class AdjustTable < ActiveRecord::Migration[5.2]
  def change
  	if column_exists? :contacts, :content
  		remove_column :contacts, :content
  	end

	unless column_exists? :contacts, :target
  		add_column :contacts, :target, :string
  	end

	if column_exists? :courses, :price
  		remove_column :courses, :price
  	end

  	Contact.update_all(target: :none)
  end
end
