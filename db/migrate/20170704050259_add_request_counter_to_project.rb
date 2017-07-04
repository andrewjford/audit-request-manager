class AddRequestCounterToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :request_counter, :integer, default: 1
  end
end
