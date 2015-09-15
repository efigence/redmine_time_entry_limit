module RedmineTimesheetPlugin
  module Patches
    module TimelogControllerPatch

      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable
          alias_method_chain :new, :user_id
          alias_method_chain :create, :user_id
        end
      end

      module InstanceMethods

        def new_with_user_id
          if !params[:time_entry].blank?
            user = params[:time_entry][:user_id].blank? ? User.current : User.find(params[:time_entry][:user_id])
          else
            user = User.current
          end
          @time_entry ||= TimeEntry.new(:project => @project, :issue => @issue, :user => user, :spent_on => User.current.today)
          @time_entry.safe_attributes = params[:time_entry]
        end

        def create_with_user_id
          @time_entry ||= TimeEntry.new(:project => @project, :issue => @issue, :user => User.current, :spent_on => User.current.today)
          @time_entry.safe_attributes = params[:time_entry]
          if @time_entry.project && !User.current.allowed_to?(:log_time, @time_entry.project)
            render_403
            return
          end

          call_hook(:controller_timelog_edit_before_save, { :params => params, :time_entry => @time_entry })

          if @time_entry.save
            respond_to do |format|
              format.html {
                flash[:notice] = l(:notice_successful_create)
                if params[:continue]
                  options = {
                    :time_entry => {
                      :project_id => params[:time_entry][:project_id],
                      :issue_id => @time_entry.issue_id,
                      :activity_id => @time_entry.activity_id,
                      :user_id => @time_entry.user_id
                    },
                    :back_url => params[:back_url]
                  }
                  if params[:project_id] && @time_entry.project
                    redirect_to new_project_time_entry_path(@time_entry.project, options)
                  elsif params[:issue_id] && @time_entry.issue
                    redirect_to new_issue_time_entry_path(@time_entry.issue, options)
                  else
                    redirect_to new_time_entry_path(options)
                  end
                else
                  redirect_back_or_default project_time_entries_path(@time_entry.project)
                end
              }
              format.api  { render :action => 'show', :status => :created, :location => time_entry_url(@time_entry) }
            end
          else
            respond_to do |format|
              format.html { render :action => 'new' }
              format.api  { render_validation_errors(@time_entry) }
            end
          end
        end
      end
    end
  end
end
 