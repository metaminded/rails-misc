class EditorAceInput < SimpleForm::Inputs::Base
  def input
    id = "#{object.class.name.underscore}_#{attribute_name}"
    "<div class=\"ace-editor-wrapper\"><pre id=\"ace-editor-#{id.gsub('_',"-")}\" data-ace-editor-target=\"#{id}\"></pre>#{@builder.text_area(attribute_name, input_html_options)}</div>".html_safe
  end
end
