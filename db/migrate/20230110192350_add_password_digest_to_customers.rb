class AddPasswordDigestToCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :password, :string
    add_column :customers, :password_digest, :string
  end
end
