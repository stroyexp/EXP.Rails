module Html5Helper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::CsrfHelper

  # HTML5 tag format
  def tag(name, options = nil, open = false, escape = true)
    if Slim::Engine.options[:format] == :html
      open = true
    end
    "<#{name}#{tag_builder.tag_options(options, escape) if options}#{open ? ">" : " />"}".html_safe
  end

  # Remove linebreak
  def csrf_meta_tags
    if protect_against_forgery?
      [
          tag(:meta, name: 'csrf-param', content: request_forgery_protection_token),
          tag(:meta, name: 'csrf-token', content: form_authenticity_token)
      ].join("").html_safe
    end
  end

  private

  def boolean_tag_option(key)
    Slim::Engine.options[:format] == :html ? %(#{key}) : %(#{key}="#{key}")
  end

end
