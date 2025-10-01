class DatePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    options = {
      type: 'date'
    }

    # Format date for HTML5 date input
    value = if object.respond_to?(attribute_name) && object.send(attribute_name).respond_to?(:to_date)
      object.send(attribute_name).to_date.strftime('%Y-%m-%d')
    end

    options[:value] = value if value.present?

    super.merge options
  end
end