require 'spec_helper'

describe Sprockets::Mustache::Template::Generator do

  let :generator do

    namespace = "my.Namespace"
    logical_path = "javascripts/backbone/templates/mustache/entryList"
    template_string = <<-HTML
<table class="ledger">
  <thead>
    <tr>
      <th class="date">Date</td>
      <th class="name">Name</td>
      <th class="category">Category</td>
      <th class="amount">Amount ($)</td>
    </tr>
  </thead>
  {{{rows}}}
</table>
    HTML

    Sprockets::Mustache::Template::Generator.new(namespace, logical_path, template_string)
  end

  it "calculates the template name" do
    generator.template_name.should == "javascripts/backbone/templates/mustache/entryList"
  end

  describe "#generate" do
    before do
      @js = generator.generate
    end

    it "makes the named JS function as a string" do
      @js.should be_present
    end

    it "assigns the correct namespace" do
      @js.should match(/my\.Namespace\.mustache\['javascripts\/backbone\/templates\/mustache\/entryList'\] = \{/)
    end

    it "puts the template in the mustache object" do
      @js.should match(/<table class="ledger">/)
    end

    it "has a render function that calls Mustache.to_html" do
      @js.should match(/Mustache\.to_html/)
    end

    it "passes partials to to_html" do
      @js.should match(/to_html.+, partials/)
    end

  end
end