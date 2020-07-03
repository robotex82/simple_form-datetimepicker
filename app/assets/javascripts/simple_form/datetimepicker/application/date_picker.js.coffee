$ ->
  $("input[data-behaviour='date_picker']").each ->
    date = $(this).val()
    format = $(this).data('date-format')
    if moment.isDate(date)
      options = {
        defaultDate: moment(date, format),
        format: format,
      }
    else
      options = {
        format: format,
        sideBySide: true
      }

    if $(this).data('icon-provider') == 'fa'
      options['icons'] = {
        time: "fas fa-clock",
        date: "fas fa-calendar",
        up: "fas fa-caret-up",
        down: "fas fa-caret-down",
        previous: "fas fa-caret-left",
        next: "fas fa-caret-right",
        today: "fas fa-today",
        clear: "fas fa-clear",
        close: "fas fa-close"
      }
    $(this).datetimepicker(options)