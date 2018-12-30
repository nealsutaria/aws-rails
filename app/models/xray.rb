class Xray < ApplicationRecord
  has_many :record_xrays
  has_many :records, through: :record_xrays
end
