# encoding: utf-8
require 'redmine'

if Rails::VERSION::MAJOR < 3
  require 'dispatcher'
  object_to_prepare = Dispatcher
else
  object_to_prepare = Rails.configuration
  # if redmine plugins were railties:
  # object_to_prepare = config
end

object_to_prepare.to_prepare do
  require_dependency 'time_entry'
  TimeEntry.send(:include, RedmineTimesheetPlugin::Patches::TimeEntryPatch)
end

unless Redmine::Plugin.registered_plugins.keys.include?(:redmine_timesheet_plugin)
  Redmine::Plugin.register :redmine_time_entry_limit do
    name 'Redmine Time Entry Limit'
    author 'Rafał Lisowski'
    description 'This is a Time Entry extension plugin for hours validations'
    url 'https://github.com/efigence/redmine_time_entry_limit'
    author_url 'http://www.efigence.com/'

    version '0.0.1'
    requires_redmine :version_or_higher => '0.9.0'

    settings(:default => {
               'limit' => '20',
               'day_limit' => '7'
             }, :partial => 'settings/time_entry_limit_settings')

  end

end
