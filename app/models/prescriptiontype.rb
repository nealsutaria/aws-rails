class Prescriptiontype < ApplicationRecord
  has_many :record_prescription_types
  has_many :records, through: :record_prescription_types
end
