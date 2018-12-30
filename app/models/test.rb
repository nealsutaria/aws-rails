class Test < ApplicationRecord
  has_many :record_tests
  has_many :records, through: :record_tests
end
