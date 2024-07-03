class Doctor < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  has_many :specialties, dependent: :destroy
  has_many :consultation_fees, through: :specialties

  validates :first_name, :last_name, :description, :link, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def link_name
    "#{first_name.downcase}-#{last_name.downcase}"
  end

  def formatted_consultation_titles_and_values
    consultation_fees.where(specialty_id: specialties.ids).map do |consultation_fee|
      {
        consultation_title: consultation_fee,
        value: number_to_currency(consultation_fee.value),
        specialty: consultation_fee.specialty
      }
    end
  end
end
