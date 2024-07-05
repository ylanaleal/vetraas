class Specialty < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :doctor

  validates :title, :value, presence: true
  validates :value, numericality: { greater_than: 0 }

  def formatted_value
    number_to_currency(value)
  end
end
