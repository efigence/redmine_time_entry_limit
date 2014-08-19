class AddIssueIdEnforceField < ActiveRecord::Migration
  def change
    add_column :projects, :enforce_issue_id, :boolean, :default => false, :null => false
  end
end
