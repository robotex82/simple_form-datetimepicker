class DateTimePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    value = object.send(attribute_name)
    options = {
      value: value.nil?? nil : I18n.localize(value),
      data: {
        behaviour: 'date_picker',
        'date-format':  I18n.t('time.formats.date_picker')
      }
    }
    super.merge options
  end
end