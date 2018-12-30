class Prescription < ApplicationRecord
  has_many :record_prescriptions
  has_many :records, through: :record_prescriptions
include PgSearch
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
