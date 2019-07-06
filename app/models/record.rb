class Record < ApplicationRecord
  validates :date, presence: true
  # validates :name, presence: true
  mount_uploader :photo, PhotoUploader


  belongs_to :user
  has_many :record_prescriptions, dependent: :destroy
  has_many :prescriptions, through: :record_prescriptions
  has_many :record_tests, dependent: :destroy
  has_many :tests, through: :record_tests
  has_many :record_prescription_types, dependent: :destroy
  has_many :prescriptiontypes, through: :record_prescription_types

  has_many :record_xrays, dependent: :destroy
  has_many :xrays, through: :record_xrays

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

    pg_search_scope :search_by_name_other,
    against: [ :name_other ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

     pg_search_scope :search_by_prescription_name,
    against: [ :prescription_name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    pg_search_scope :search_by_name_and_description,
    against: [ :name, :description],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

    pg_search_scope :search_by_name_and_description_other,
    against: [ :name_other, :description_other],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end


