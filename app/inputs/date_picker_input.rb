class DatePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    value = object.send(attribute_name)
    options = {
      value: value.respond_to?(:to_date) ? I18n.localize(value.to_date) : nil,
      data: {
        behaviour: 'date_picker',
        'date-format': I18n.t('date.formats.date_picker')
      }
    }
    super.merge options
  end
end