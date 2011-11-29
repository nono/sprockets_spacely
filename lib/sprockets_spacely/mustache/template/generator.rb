module Sprockets
  module Mustache
    module Template
      class Generator

        attr_reader :template_name

        def initialize(namespace, logical_path, template_string, library)
          @template_name = logical_path
          @namespace = namespace
          @template_string = template_string
          @library = library
        end

        def generate

          js_function = <<-JS
(function($) {

  #{@namespace}.mustache['#{@template_name}'] = {
    template: "#{@template_string}",
    render: render
  };

  function render(obj, partials) {
    return Mustache.to_html(#{@namespace}.mustache['#{@template_name}'].template, obj, partials);
  }
}(#{@library}));
          JS

        end
      end
    end
  end
end

