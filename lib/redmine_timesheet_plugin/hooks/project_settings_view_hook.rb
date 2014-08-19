module RedmineTimesheetPlugin
  module Hooks
    class ProjectSettingsViewHook < Redmine::Hook::ViewListener
      render_on(:view_projects_form, :partial => 'projects/enforce_issue_id', :layout => false)
    end
  end
end
