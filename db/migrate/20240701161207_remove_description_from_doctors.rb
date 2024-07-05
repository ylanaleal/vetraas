class RemoveDescriptionFromDoctors < ActiveRecord::Migration[7.1]
  def change
    remove_column :doctors, :description, :string
  end
end
