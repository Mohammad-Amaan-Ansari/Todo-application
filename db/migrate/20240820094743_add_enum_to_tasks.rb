# frozen_string_literal: true

# db/migrate/20240820094743_add_enum_to_tasks.rb
class AddEnumToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :priority, :integer, default: 0
    add_column :tasks, :status, :integer, default: 0
  end
end
