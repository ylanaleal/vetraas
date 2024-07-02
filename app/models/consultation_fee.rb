class ConsultationFee < ApplicationRecord
  belongs_to :specialty
  before_validation :set_defaults

  validates :value, numericality: { greater_than_or_equal_to: 0 }
  validates :title, presence: true
  validates :value, presence: true

  private

  def set_defaults
    self.title = "Me edite" if title.blank?
    self.value = 0 if value.blank?
  end
end
