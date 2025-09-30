// Import dependencies (these will be resolved by importmap)
import $ from "jquery"
import moment from "moment"
import "bootstrap-datetimepicker"

// show a greeting on load (support turbo)
document.addEventListener("turbo:load", function() {
  console.log("[SimpleForm::Datetimepicker] ❤️");
});

// Modern ES6 version of the CoffeeScript functionality
document.addEventListener('DOMContentLoaded', function() {
  const datePickers = document.querySelectorAll("input[data-behaviour='date_picker']");
  
  datePickers.forEach(function(element) {
    // Find the proper container - look for .form-group or create a positioned parent
    let container = element.closest('.form-group') || element.closest('.input-group') || element.parentElement;
    
    // Ensure the container has proper positioning
    const computedStyle = window.getComputedStyle(container);
    if (computedStyle.position === 'static') {
      container.style.position = 'relative';
    }
    
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
    
    // Apply datetimepicker to the input, but ensure proper container positioning
    try {
      $(element).datetimepicker(options);
    } catch (error) {
      console.error('Error initializing datetimepicker:', error);
    }
  });
});
