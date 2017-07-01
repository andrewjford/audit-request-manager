class AddRequestNumberToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :request_number, :integer
  end
end
