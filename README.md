# FastExcelRails

A Rails template handler for the [fast_excel](https://github.com/Paxa/fast_excel) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "fast_excel_rails"
```

And then execute:

```
$ bundle install
```

## Usage

### Controllers

The default template file for your controller action can be rendered using `format.xlsx`:

```ruby
class ThingsController < ApplicationController
  def index
    @things = (1..1000).to_a
    respond_to do |format|
      format.xlsx
    end
  end
end
```

Other options, like filenames or custom template paths, can be set using an explicit render call:

```ruby
class ThingsController < ApplicationController
  def index
    respond_to do |format|
      format.xlsx { render :xlsx => "my filname.xlsx", :template => "custom_template"
    end
  end
end
```

### Templates

Templates use the `.xlsx.fast_excel` extension and are normal Ruby files that have access to a `workbook` variable that is a [`FastExcel::Workbook`](https://github.com/Paxa/fast_excel) instance.

For example, `app/views/things/index.xlsx.fast_excel`:

```ruby
worksheet = workbook.add_worksheet

worksheet.append_row(["Message", "Price", "Date"], workbook.bold_format)

@things.each do |i|
  worksheet << ["Hello", (rand * i).round(2), Time.now])
end
```

See [fast_excel](https://github.com/Paxa/fast_excel) for further information on usage syntax.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fast_excel_rails.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
