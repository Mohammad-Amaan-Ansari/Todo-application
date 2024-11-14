class AddEnumToTasks< ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :priority, :integer, default: 0  
    add_column :tasks, :status, :integer, default: 0    
  end
end
