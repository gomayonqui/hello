require_dependency "hello/application_controller"

#
# IT IS RECOMMENDED THAT YOU DO NOT OVERRIDE THIS FILE IN YOUR APP
#

module Hello
  class ActiveSessionsController < ApplicationController
    
    before_actions do
      all            { restrict_access_to_sudo_mode }
      only(:index)   { @active_sessions = hello_user.active_sessions }
      only(:destroy) { @active_session  = hello_user.active_sessions.find(params[:id]) }
    end

    # GET /hello/active_sessions
    def index
    end

    # DELETE /hello/active_sessions/1
    def destroy
      entity = DestroyActiveSessionEntity.new
      if @active_session.destroy
        flash[:notice] = entity.success_message
      else
        flash[:alert]  = entity.alert_message
      end
      redirect_to active_sessions_url
    end

  end
end
