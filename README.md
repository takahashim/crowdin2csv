# Crowdin2csv

`Crowdin2csv` is a CLI tool to convert a XLIFF file from [cronwdin](https://crowdin.com) into CSV file.

## Installation

`Crowdin2csv` is a rubygems. Install with `gem` command:

```console
$ gem install crowdin2csv
```

## Usage

```console
## to generate foo.csv
$ crowdin2csv foo.xliff

## to generate bar.csv
$ crowdin2csv -o bar.csv foo.xliff
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takahashim/crowdin2csv.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
