require "notifications/engine"
require "notifications/model"
require "notifications/configuration"

module Notifications
  extend self

  def config
    return @config if defined?(@config)
    @config = Configuration.new
    @config.object_class = 'User'
    @config.ancestry_type = ''
    @config
  end

  def configure(&block)
    config.instance_exec(&block)
  end

end
