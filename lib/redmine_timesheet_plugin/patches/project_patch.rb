module RedmineTimesheetPlugin
  module Patches
    module ProjectPatch
      def self.included(base)
        base.class_eval do
          safe_attributes 'enforce_issue_id'
        end
      end
    end
  end
end
