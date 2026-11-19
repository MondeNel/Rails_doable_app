class AddCompletedToTodo < ActiveRecord::Migration[8.1]
  def change
    add_column :todos, :completed, :string
    add_column :todos, :false, :string
  end
end
