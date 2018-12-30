class RecordPrescription < ApplicationRecord
  belongs_to :record
  belongs_to :prescription
end
