class HealthRecord < ApplicationRecord
  belongs_to :user

  validates :content,
            presence: true,
            length: { maximum: 200 }

  has_many :likes, dependent: :destroy
end
