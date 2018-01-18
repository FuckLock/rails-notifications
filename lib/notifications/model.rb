require 'active_support/concern'

module Notifications
  module Model
    extend ActiveSupport::Concern

    included do
      # define belongs_to relationships
      belongs_to :subject, class_name: Notifications.config.object_class
      belongs_to :target, class_name: Notifications.config.object_class
      belongs_to :ancestry, polymorphic: true
      belongs_to :second_ancestry, polymorphic: true
      belongs_to :third_ancestry, polymorphic: true

      # define has_many relationships
      Object.const_get(Notifications.config.object_class).class_eval do
        options                        = {}
        config                         = Notifications.config
        notify_type                    = config.notify_type
        ancestry_type                  = config.ancestry_type
        second_ancestry_type           = config.second_ancestry_type
        third_ancestry_type            = config.third_ancestry_type
        options[:notify_type]          = notify_type
        options[:ancestry_type]        = ancestry_type        if ancestry_type.present?
        options[:second_ancestry_type] = second_ancestry_type if second_ancestry_type.present?
        options[:third_ancestry_type]  = third_ancestry_type  if third_ancestry_type.present?
        has_many :notifications, -> { where(options) }, foreign_key: :target_id, dependent: :destroy
        has_many :subjects, through: :notifications
      end

      # define scope
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
