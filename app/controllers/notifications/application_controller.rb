module Notifications
  class ApplicationController < ActionController::Base
    helper_method :current_user

    alias_method :current_user, Notifications.config.current_user_method.to_sym

  end
end
