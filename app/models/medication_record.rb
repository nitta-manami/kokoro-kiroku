class MedicationRecord < ApplicationRecord
  belongs_to :user

  enum :status, {
    taken: 0,
    missed: 1
  }
end
