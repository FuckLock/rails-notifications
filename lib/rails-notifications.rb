require "notifications/engine"
require "notifications/model"
require "notifications/configuration"
require "kaminari"

module Notifications
  extend self

  def config
    return @config if defined?(@config)
    @config                        = Configuration.new
    @config.object_class           = 'User'
    @config.notify_type            = 'mention'
    @config.ancestry_type          = ''
    @config.second_ancestry_type   = ''
    @config.third_ancestry_type   = ''
    @config.current_user_method    = 'current_user'
    @config.user_avatar_method = ''
    @config
  end

  def configure(&block)
    config.instance_exec(&block)
  end

end
