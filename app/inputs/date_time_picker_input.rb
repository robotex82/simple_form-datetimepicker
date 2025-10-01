class DateTimePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    options = {
      type: "datetime-local"
    }

    # Format datetime for HTML5 datetime-local input
    value = if object.respond_to?(attribute_name) && object.send(attribute_name).present?
      datetime = object.send(attribute_name)
      datetime.strftime("%Y-%m-%dT%H:%M")
    end

    options[:value] = value if value.present?

    super.merge options
  end
end
