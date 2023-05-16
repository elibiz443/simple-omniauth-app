class ApplicationController < ActionController::Base
  include ApplicationHelper
  include SessionsHelper
  before_action :authorized
  before_action :restrict_login_page
  helper_method :current_user
  helper_method :logged_in?
end
