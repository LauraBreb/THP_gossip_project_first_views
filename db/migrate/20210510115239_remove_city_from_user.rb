class RemoveCityFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :city_id
    remove_column :users, :city_id, :string
  end
end
