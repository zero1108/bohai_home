class Course < ApplicationRecord

  validates_presence_of :name, :introduction
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :position, presence: true, numericality: { only_integer: true }

end
