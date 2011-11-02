module Sprockets
  module Mustache
    module Template
      class Processor < Tilt::Template
        include ActionView::Helpers::JavaScriptHelper

        def self.default_mime_type
          'application/javascript'
        end

        def prepare
        end

        def evaluate(scope, locals, &block)

          namespace = Namespace.value || "window"

          Generator.new(namespace, scope.logical_path, escape_javascript(data)).generate
        end
      end
    end
  end

  register_engine '.mustache', ::Sprockets::Mustache::Template::Processor
end