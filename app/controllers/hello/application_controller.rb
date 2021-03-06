#
# IT IS RECOMMENDED THAT YOU DO NOT OVERRIDE THIS FILE IN YOUR APP
#

class Hello::ApplicationController < ApplicationController
  include BeforeActions::Controller

  # authorization intentionally simple
  # this code is expected to be rewritten after more core features are developed
  # accepting PR :)
  before_action do
    either = 0
    guest  = 1
    user   = 2
    admin  = 10

    guest_homepage = hello.root_path
    user_homepage  = hello.user_path
    admin_homepage = hello.admin_path

    autho_c = autho_data[controller_name.to_sym]
    must_be_a = autho_c.is_a?(Hash) ? autho_c[action_name.to_sym] : autho_c

    case must_be_a
    when guest     then redirect_to user_homepage  if hello_active_session.present?
    when user      then raise Hello::NotAuthenticated if hello_active_session.blank?
    when admin     then redirect_to admin_homepage if hello_active_session.present? && !hello_user.admin?
    when either # nothing to do, yay
    else
      raise "No Authorization Rules for '#{controller_name}##{action_name}'"
    end
  end

  rescue_from ActionController::ParameterMissing do |exception|
    data = {
      maintenance: false,
      action:      "#{controller_name}##{action_name}",
      exception: {
        class:       exception.class.name,
        message:     exception.message,
        # backtrace:   exception.backtrace
      }
    }

    respond_to do |format|
      format.html { raise exception }
      format.json { render json: data, status: :bad_request } # 400
    end
  end

  rescue_from Hello::NotAuthenticated do |exception|
    data = {
      exception: {
        class:       exception.class.name,
        message:     exception.message,
        # backtrace:   exception.backtrace
      }
    }

    # headers["WWW-Authenticate"] = exception.message

    respond_to do |format|
      format.html do
        flash[:alert] = exception.alert_message
        session[:url] = request.fullpath
        redirect_to hello.classic_sign_in_path
      end
      format.json { render json: data, status: :bad_request } # 400
    end
  end

  rescue_from Hello::JsonNotSupported do |exception|
    data = {
      exception: {
        class:       exception.class.name,
        message:     exception.message
      }
    }

    render json: data, status: :bad_request
  end


  private

  def autho_data
    either = 0
    guest  = 1
    user   = 2
    admin  = 10

    {
      welcome: guest,
      sign_out: either,
      locale:   either,
      registration: {
        #
        sign_up:          guest,
        create:           guest,
        after_sign_up:    either,
        #
        sign_in:          guest,
        authenticate:     guest,
        after_sign_in:    user,
        #
        forgot:           guest,
        ask:              guest,
        after_forgot:     guest,
        #
        reset_token:      guest,
        reset:            guest,
        save:             guest,
        after_reset:      either,
        #
        confirm_email_send:    user,
        confirm_email_token:   either,
        after_confirm_email:   either,
        confirm_email_expired: either,
      },
      user: user,
      credentials: user,
      active_sessions:    user,
      sudo_mode:   user,
      deactivation: {
        proposal:         user,
        deactivate:       user,
        after_deactivate: guest,
      },
      #
      admin: admin,
      impersonation: {
        create:  admin,
        destroy: user
      },
      #
    }
  end

end
