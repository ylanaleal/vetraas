class AddLinkToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :link, :string
  end
end
