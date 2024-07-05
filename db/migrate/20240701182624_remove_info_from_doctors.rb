class RemoveInfoFromDoctors < ActiveRecord::Migration[7.1]
  def change
    remove_column :doctors, :speciality, :string
    remove_column :doctors, :value, :string
  end
end
