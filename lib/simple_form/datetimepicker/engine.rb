module SimpleForm
  module Datetimepicker
    class Engine < ::Rails::Engine
      isolate_namespace SimpleForm::Datetimepicker

      initializer "simple_form-datetimepicker.importmap", before: "importmap" do |app|
        if defined?(Importmap)
          puts "[SimpleForm::Datetimepicker] Adding importmap paths"
          app.config.importmap.paths << root.join("config/importmap.rb")
          app.config.importmap.cache_sweepers << root.join("app/javascript")
        end
      end
  
      # Ensure asset server (Propshaft/Sprockets) can find JS files
      initializer "simple_form-datetimepicker.assets" do |app|
        app.config.assets.paths << root.join("app/javascript")
      end
    end
  end
end
