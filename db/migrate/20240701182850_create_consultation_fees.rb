class CreateConsultationFees < ActiveRecord::Migration[7.1]
  def change
    create_table :consultation_fees do |t|
      t.string :value
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
