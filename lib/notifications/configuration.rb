module Notifications
  class Configuration
    attr_accessor :object_class
    attr_accessor :notify_type
    attr_accessor :ancestry_type
    attr_accessor :second_ancestry_type
    attr_accessor :third_ancestry_type
    attr_accessor :current_user_method
    attr_accessor :user_avatar_method
  end
end
