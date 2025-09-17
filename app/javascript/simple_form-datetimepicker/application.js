// Import dependencies (these will be resolved by importmap)
import moment from "moment"
import "bootstrap-datetimepicker"

// Modern ES6 version of the CoffeeScript functionality
document.addEventListener('DOMContentLoaded', function() {
  const datePickers = document.querySelectorAll("input[data-behaviour='date_picker']");
  
  datePickers.forEach(function(element) {
    const date = element.value;
    const format = element.dataset.dateFormat;
    let options = {};
    
    if (moment.isDate(date)) {
      options = {
        defaultDate: moment(date, format),
        format: format,
      };
    } else {
      options = {
        format: format,
        sideBySide: element.dataset.sideBySide === 'true'
      };
    }
    
    if (element.dataset.iconProvider === 'fa') {
      options.icons = {
        time: "fas fa-clock",
        date: "fas fa-calendar", 
        up: "fas fa-caret-up",
        down: "fas fa-caret-down",
        previous: "fas fa-caret-left",
        next: "fas fa-caret-right",
        today: "fas fa-today",
        clear: "fas fa-clear",
        close: "fas fa-close"
      };
    }
    
    // Assuming jQuery is available globally or imported elsewhere
    $(element).datetimepicker(options);
  });
});
