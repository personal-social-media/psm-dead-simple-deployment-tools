# PsmDeadSimpleDeploymentTools

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/psm_dead_simple_deployment_tools`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'psm_dead_simple_deployment_tools'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install psm_dead_simple_deployment_tools

## Usage

### Files

```ruby
include PsmDeadSimpleDeploymentTools::Files

# writing a file once
write("file_path") do # supports write("file_path", "template_path.erb") 
  "new content"
end

# appending to a file once
append("file_path") do # supports append("file_path", "template_path.erb") 
  "appended content"
end

# find and replace content from file
# match can be a String or Regexp
replace("file_path", /my-match/) do # supports replace("file_path", /my-match/, "template_path.erb") 
  "replaced content"
end
```

#### How to use template.erb

```ruby
# inside app.rb

def write_my_config_file
  @hostname = `hostname`
  write("tmp/my-hostname", "my_template_file.erb")
end
```

```text
# inside my_template_file
my hostname is: <%= @hostname %>
```

### Packages
```ruby
#only apt support currently
include PsmDeadSimpleDeploymentTools::Packages

# updates package repo and installs packages
install_packages("vim", "libpq-dev")

# removes packages
remove_packages("vim", "libpq-dev")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/personal-social-media/psm_dead_simple_deployment_tools. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/psm_dead_simple_deployment_tools/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PsmDeadSimpleDeploymentTools project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/psm_dead_simple_deployment_tools/blob/master/CODE_OF_CONDUCT.md).
