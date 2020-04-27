class AddTimeToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :time, :string
  end
end
