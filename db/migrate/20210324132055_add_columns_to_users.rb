class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :string
    add_column :users, :dominant_arm, :string
    add_column :users, :admin, :boolean, default: false
  end
end
