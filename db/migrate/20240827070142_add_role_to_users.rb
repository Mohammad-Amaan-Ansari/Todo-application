# frozen_string_literal: true

# db/migrate/20240827070142_add_role_to_users.rb
class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer
  end
end
