class Course < ApplicationRecord

  validates_presence_of :name, :introduction
  validates :position, presence: true, numericality: { only_integer: true }

end
