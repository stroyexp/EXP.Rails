class ControlFileInput
  include Formtastic::Inputs::Base

  def to_html
    input_wrapping do
      label_html <<
      builder.file_field(method, input_html_options)
      template.tag :span, class: 'c-control-file__control'
    end
  end

  def input_html_options
    {class: ['c-control-file__input']}.merge(super)
  end

  def label_html_options
    super.merge(for: input_html_options[:id],
                class: ['c-control-file'])

  end

#  def wrapping_html_options
#    {class: ['c-control-file']}.merge(super)
#  end

end
