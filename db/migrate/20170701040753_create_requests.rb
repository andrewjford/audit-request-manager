class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :description
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
