# SimpleForm::Datetimepicker
Short description and motivation.

## Usage

Add the javascripts:

    # app/assets/application.js
    //= require simple_form-datetimepicker

Add the stylesheets:

    # app/assets/application.css
    /*
     *= require simple_form-datetimepicker
     */

Use in in your simple form:

    # date picker only
    = form.input :start_at, as: :date_picker

    # date time picker
    = form.input :start_at, as: :date_time_picker

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'simple_form-datetimepicker'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install simple_form-datetimepicker
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
