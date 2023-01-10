class RemovePasswordFromEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :password, :string
  end
end
