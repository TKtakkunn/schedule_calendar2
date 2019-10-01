class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end

  helper_method :current_member

  class LoginRequired < StandardError; end
  class Forbidden < StandardError; end

  private def login_required
    raise LoginRequired unless current_member
  end
end
