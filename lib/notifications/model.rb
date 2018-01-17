require 'active_support/concern'

module Notifications
  module Model
    extend ActiveSupport::Concern

    included do
      belongs_to :subject, class_name: Notifications.config.object_class
      belongs_to :target, class_name: Notifications.config.object_class
      belongs_to :ancestry, polymorphic: true
      belongs_to :second_ancestry, polymorphic: true

      # define has_many relationships
      has_many_scope = -> { where(notify_type: Notifications.config.notify_type,
                            ancestry_type: Notifications.config.ancestry_type,
                            second_ancestry_type: Notifications.config.second_ancestry_type) }

      Object.const_get(Notifications.config.object_class).class_eval do
        has_many :notifications, has_many_scope, foreign_key: :target_id, dependent: :destroy
        has_many :subjects, through: :notifications
      end

      Object.const_get(Notifications.config.ancestry_type).class_eval do
        has_many :notifications, has_many_scope, foreign_key: :ancestry_id, dependent: :destroy
      end

      Object.const_get(Notifications.config.second_ancestry_type).class_eval do
        has_many :notifications, has_many_scope, foreign_key: :second_ancestry_id, dependent: :destroy
      end

      scope :unread, -> { where(read_at: nil) }
    end

    module ClassMethods
      def read!(ids = [])
        return if ids.blank?
        Notification.where(id: ids).update_all(read_at: Time.now)
      end
    end

  end
end
