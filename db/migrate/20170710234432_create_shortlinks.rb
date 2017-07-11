class CreateShortlinks < ActiveRecord::Migration[5.1]
  def change
    create_table :shortlinks do |t|
      t.string :url
      t.string :create_ip

      t.timestamps
    end
  end
end
