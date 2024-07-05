class RemoveLinkFromDoctors < ActiveRecord::Migration[7.1]
  def change
    remove_column :doctors, :link, :string
  end
end
