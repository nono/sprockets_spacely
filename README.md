# Sprockets-Spacely

A way to hook Mustache.js into your Sprockets 2 and Rails Asset Pipeline.

Big thanks to Ryan Dy & [his take on the problem for jQuery templates](https://github.com/rdy/sprockets-jquery-tmpl).

## In your Gemfile:

`gem 'sprockets_spacely'`

We assume that you are requiring jQuery and Mustache.js higher up in your Sprockets bundle.

## In a Rails Initializer (or your Ruby framework's equivalent)

```ruby
Sprockets::Mustache::Template::Namespace.value = 'namespace.for.my.templates'
```

This will take any *.mustache file under Sprockets' paths and generate a closure that sets a function that evaluates your template.

File: "app/assets/javascripts/my_template.mustache"

```html
{{name}}:
<ul>
  {{#items}}
  <li>{{.}}</li>
  {{/items}}
</ul>
```

This function will be created:

```javascript
(function($) {

  namespace.for.my.templates.mustache['javascripts/my_template'] = render;

  function render(obj) {
    var template = "{{name}}: <ul> {{#items}}<li>{{.}}</li>{{/items}} </ul>"";
    return Mustache.to_html(template, obj);
  }
}(jQuery));
```

...which Sprockets will add to the appropriate JavaScript asset bundle.

Which means in your code you can call:

```javascript
  namespace.for.my.templates.mustache['javascripts/my_template']({
    name: "George",
    items: ["Judy", "Jane", "Elroy", "Astro"]
  });
```

