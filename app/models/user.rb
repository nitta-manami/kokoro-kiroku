class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :medication_records, dependent: :destroy
  has_many :health_records, dependent: :destroy
  has_many :likes, dependent: :destroy
end
