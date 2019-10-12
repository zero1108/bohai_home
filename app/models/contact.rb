class Contact < ApplicationRecord
  validates :phone, phone: true
  validates_presence_of :content, :name
    
  acts_as_enum :state, %W(new dealed), %W(待处理 已处理)
  acts_as_enum :grade, %W(none 0 5 4 3 2 1), %W(未填写 零基础 N5 N4 N3 N2 N1)

  state_machine :state, :initial => :new do
    event :deal do
      transition [:new] => :dealed
    end
  end
  
end
