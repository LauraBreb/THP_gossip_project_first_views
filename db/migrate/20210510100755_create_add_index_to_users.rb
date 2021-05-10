class CreateAddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :add_index_to_users do |t|
      add_reference :users, :city, foreign_key: true

      t.timestamps
    end
  end
end
