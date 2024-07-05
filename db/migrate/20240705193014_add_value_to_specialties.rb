class AddValueToSpecialties < ActiveRecord::Migration[7.1]
  def change
    add_column :specialties, :value, :string
  end
end
