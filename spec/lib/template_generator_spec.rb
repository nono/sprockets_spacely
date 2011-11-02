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

  it "should calculate the template name" do
    generator.template_name.should == "javascripts/backbone/templates/mustache/entryList"
  end

  describe "#generate makes the named JS function" do
    before do
      @js = generator.generate
    end

    it "on the correct namespace" do
      @js.should match(/my\.Namespace\.mustache\['javascripts\/backbone\/templates\/mustache\/entryList'\] = render/)
    end

    it "with the template" do
      @js.should match(/<table class="ledger">/)
    end

    it "that invokes Mustache" do
      @js.should match(/Mustache\.to_html/)
    end
  end
end