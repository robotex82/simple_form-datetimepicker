module SimpleForm
  module Datetimepicker
    class Configuration
      attr_accessor :icon_provider
    end

    def self.configure
      yield configuration
    end

    def self.configuration
      @configuration ||= Configuration.new
    end
  end
end
