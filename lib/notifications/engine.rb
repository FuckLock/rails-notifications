module Notifications
  class Engine < ::Rails::Engine
    isolate_namespace Notifications

    initializer "notifications.assets.precompile" do |app|
      app.config.assets.precompile += %w( notifications.scss notifications.png )
    end
    
  end
end
