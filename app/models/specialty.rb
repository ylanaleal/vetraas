class Specialty < ApplicationRecord
  belongs_to :doctor
  has_many :consultation_fees, dependent: :destroy

  validates :title, presence: true
end
