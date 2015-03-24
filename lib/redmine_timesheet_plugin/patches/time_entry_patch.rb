module RedmineTimesheetPlugin
  module Patches
    module TimeEntryPatch
      def self.included(base)
        base.extend(ClassMethods)

        base.send(:include, InstanceMethods)
        base.class_eval do
          validate :validate_time_limit
          validate :validate_day_back_limit
          validate :validate_issue_id
          before_destroy :validate_day_back_limit
        end
      end

      module ClassMethods
      end

      module InstanceMethods
        def validate_issue_id
          if self.project && self.project.enforce_issue_id && !self.issue_id
            errors.add :issue_id, :blank
          end
        end

        def validate_time_limit
          if hours # another validation catches empty hours
            limit = Setting.plugin_redmine_time_entry_limit['limit'].to_f || 20
            reported = TimeEntry.where(user_id: self.user_id, spent_on: self.spent_on).sum(:hours)
            if reported && reported > 0 && reported + hours > limit
              errors.add :hours, :too_long_limit, limit: reported, day: self.spent_on
            elsif hours > limit
              errors.add :hours, :too_long
            end
          end
        end

        def validate_day_back_limit
          if !User.current.admin? && spent_on
            limit = Setting.plugin_redmine_time_entry_limit['day_limit'].to_i || 7
            errors.add :spent_on, :too_many_days, limit: limit if spent_on < Date.today - limit.days
            return false
          end
        end
      end
    end
  end
end
