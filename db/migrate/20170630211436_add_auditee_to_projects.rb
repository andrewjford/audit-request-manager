class AddAuditeeToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :auditee, :string
  end
end
