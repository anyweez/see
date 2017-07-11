class AddNameToShortlink < ActiveRecord::Migration[5.1]
  def change
    add_column :shortlinks, :name, :string
  end
end
