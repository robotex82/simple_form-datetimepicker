module SimpleForm
  module Datetimepicker
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc 'Generates the initializer'

        source_root File.expand_path('../templates', __FILE__)

        def generate_initializer
          template 'initializer.rb', 'config/initializers/simple_form-datetimepicker.rb'
        end

        # Add importmap pins
        def add_importmap_pins
          importmap_content = <<~IMPORTMAP
            pin "simple_form/datetimepicker", to: "simple_form/datetimepicker/application.js"
            pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js"
            pin "moment", to: "https://ga.jspm.io/npm:moment@2.29.4/moment.js"
            pin "bootstrap-datetimepicker", to: "https://ga.jspm.io/npm:eonasdan-bootstrap-datetimepicker@4.17.49/src/js/bootstrap-datetimepicker.js"
          IMPORTMAP
          append_to_file "config/importmap.rb", importmap_content
        end

        # Add simple_form-datetimepicker import to application.js
        def add_import_to_application_js
          append_to_file "app/javascript/application.js", "import \"simple_form/datetimepicker\"\n"
        end
      end
    end
  end
end
