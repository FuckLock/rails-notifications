require 'active_support/concern'

module Notifications
  module Model
    extend ActiveSupport::Concern

    included do
      belongs_to :subject, class_name: Notifications.config.object_class
      belongs_to :target, class_name: Notifications.config.object_class
      belongs_to :ancestry, polymorphic: true
      belongs_to :second_ancestry, polymorphic: true
    end

  end
end
