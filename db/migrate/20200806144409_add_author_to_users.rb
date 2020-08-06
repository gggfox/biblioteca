class AddAuthorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :author, :boolean, default: false
  end
end
