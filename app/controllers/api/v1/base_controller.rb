class Api::V1::BaseController < ApplicationController
  attr_accessor :current_user
  # disable the CSRF token
  protect_from_forgery with: :null_session

  # disable cookies
  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

  def api_error(opts = {})
    render nothing: true, status: opts[:status]
  end

  def authenticate_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    user_name = options.blank?? nil : options[:name]
    user = user_name && User.find_by(name: user_name)

    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
      self.current_user = user
    else
      return unauthenticated!
    end
  end

end
