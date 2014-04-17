module RedmineTimesheetPlugin
  module Hooks
    class TimeEntryControllerHook < Redmine::Hook::ViewListener
      def controller_timelog_edit_before_save(context={ })
        if user = User.find_by_id(context[:params][:time_entry][:user_id])
          context[:time_entry].user = user
        end
      end
    end
  end
end
