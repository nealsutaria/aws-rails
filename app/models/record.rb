class Record < ApplicationRecord
  validates :pick_time, presence: true


  belongs_to :user
  has_many :record_prescriptions, dependent: :destroy
  has_many :prescriptions, through: :record_prescriptions
  has_many :record_tests, dependent: :destroy
  has_many :tests, through: :record_tests
  has_many :record_prescription_types, dependent: :destroy
  has_many :prescriptiontypes, through: :record_prescription_types

  include PgSearch
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    pg_search_scope :search_by_description,
    against: [ :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
    pg_search_scope :search_by_description_other,
    against: [ :description_other ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end


