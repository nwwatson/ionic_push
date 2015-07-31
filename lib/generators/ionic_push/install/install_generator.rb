require 'rails/generators'

module IonicPush
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      def copy_config
        copy_file "ionic_push.rb", "config/initializers/ionic_push.rb"
      end
    end
  end
end
