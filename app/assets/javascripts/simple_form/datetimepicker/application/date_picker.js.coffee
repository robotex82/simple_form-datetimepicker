$ ->
  $("input[data-behaviour='date_picker']").each ->
    date = $(this).val()
    format = $(this).data('date-format')
    if moment.isDate(date)
      options = {
        defaultDate: moment(date, format),
        format: format
      }
    else
      options = {
        format: format
      }

    if $(this).data('icon-provider') == 'fa'
      options['icons'] = {
        time: "fa fa-clock-o",
        date: "fa fa-calendar",
        up: "fa fa-caret-up",
        down: "fa fa-caret-down",
        previous: "fa fa-caret-left",
        next: "fa fa-caret-right",
        today: "fa fa-today",
        clear: "fa fa-clear",
        close: "fa fa-close"
      }
    $(this).datetimepicker(options)