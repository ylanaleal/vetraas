class CreateSpecialties < ActiveRecord::Migration[7.1]
  def change
    create_table :specialties do |t|
      t.string :title
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
