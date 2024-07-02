class AddTitleToConsultationFees < ActiveRecord::Migration[7.1]
  def change
    add_column :consultation_fees, :title, :string
  end
end
