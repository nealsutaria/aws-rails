class RecordPrescriptionType < ApplicationRecord
  belongs_to :record
  belongs_to :prescriptiontype
end
