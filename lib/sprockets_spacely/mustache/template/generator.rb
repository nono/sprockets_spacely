module Sprockets
  module Mustache
    module Template
      class Generator

        attr_reader :template_name

        def initialize(namespace, logical_path, template_string)
          @template_name = logical_path
          @namespace = namespace
          @template_string = template_string
        end

        def generate

          js_function = <<-JS
(function($) {

  #{@namespace}.mustache['#{@template_name}'] = render;

  function render(obj) {
    var template = "#{@template_string}";
    return Mustache.to_html(template, obj);
  }
}(jQuery));
          JS

        end
      end
    end
  end
end

