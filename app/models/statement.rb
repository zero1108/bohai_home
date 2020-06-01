class Statement < ApplicationRecord
	acts_as_enum :type, %W(IncomeStatement OutcomeStatement), %W(收入 支出)
	validates :price, presence: true, numericality: { greater_than: 0 }
	validates :content, presence: true
end
