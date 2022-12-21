class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where.not(recipient: current_user )
  end
end
