class Teacher < ApplicationRecord
  
  validates_presence_of :name, :birthday, :introduction, :achievements

  has_one_attached :avatar
end
