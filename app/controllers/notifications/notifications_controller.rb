module Notifications
  class NotificationsController < ::ApplicationController
    def index
      @notifications = notifications.includes(:subject).order('id desc').page(params[:page])
      unread_ids = @notifications.reject{|notification| notification.read_at.present? }.select(&:id)
      Notification.read!(unread_ids)
      @notification_groups = @notifications.group_by { |note| note.created_at.to_date }
    end

    private

    def notifications
      raise "You need reqiure user login for /notifications page." unless current_user
      Notification.where(target_id: current_user.id)
    end

  end
end
