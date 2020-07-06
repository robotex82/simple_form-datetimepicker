class DatePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    value = object.send(attribute_name)
    options = {
      value: value.respond_to?(:to_date) ? I18n.localize(value.to_date, format: :date_picker) : nil,
      data: {
        behaviour: 'date_picker',
        'date-format':  I18n.t('date.formats.date_picker_js')
      }
    }
    options[:data][:'side-by-side'] =  @options[:'side_by_side'] || false
    options[:data][:'icon-provider'] = case @options[:icons]
    when :font_awesome
      'fa'
    else
      nil
    end

    super.merge options
  end
end