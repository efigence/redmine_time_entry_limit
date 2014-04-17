module RedmineTimesheetPlugin
  module Hooks
    class TimeEntryViewHook < Redmine::Hook::ViewListener
      render_on(:view_timelog_edit_form_bottom, :partial => 'timelog/add_user', :layout => false)
    end
  end
end
