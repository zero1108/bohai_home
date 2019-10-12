require 'acts_as_enum'

class ApplicationRecord < ActiveRecord::Base
  include ActsAsEnum
  self.abstract_class = true
end
