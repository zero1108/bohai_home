class News < ApplicationRecord
  acts_as_enum :state, %W(new submitted), %W(待发布 已发布)

  
end
