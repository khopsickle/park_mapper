class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  private

    def permanent_sign_in(user)
      user.regenerate_auth_token
      cookies.permanent[:auth_token] = user.auth_token
      @current_user = user
    end

    def require_login
      unless signed_in_user?
        flash[:danger] = "You must be signed in!"
        redirect_to login_path
      end
    end

    def require_admin
      unless current_user == User.first
        flash[:danger] = "You do not have permission to do that."
        redirect_to login_path
      end
    end

    def signed_in_redirect
      redirect_to current_user if signed_in_user?
    end

    def signed_in_user?
      !!current_user
    end
    helper_method :signed_in_user?

    def current_user
      if cookies[:auth_token]
        @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
      end
    end
    helper_method :current_user

    def sign_in(user)
      user.regenerate_auth_token
      cookies[:auth_token] = user.auth_token
      @current_user = user
    end

    def sign_out
      @current_user = nil
      cookies.delete(:auth_token)
    end
end
