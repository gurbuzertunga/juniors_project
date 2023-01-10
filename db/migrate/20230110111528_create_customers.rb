class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password
      t.string :name
      t.date :date_of_birth

      t.timestamps
    end
  end
end
