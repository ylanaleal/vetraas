class Doctor < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  has_many :specialties, dependent: :destroy

  validates :first_name, :last_name, :description, presence: true
  validates :description, length: { maximum: 300 }

  has_one_attached :photo

  def full_name
    "#{first_name.strip.capitalize} #{last_name.strip.capitalize}"
  end

  def link_name
    join_name = full_name.split.join("-").downcase
    return join_name
  end

  def specialties_join
    specialties.map(&:title).join(", ").strip
  end
end
