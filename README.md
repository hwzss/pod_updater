![pod_updater](https://github.com/hwzss/sketch_learning/blob/master/%E4%BD%9C%E5%93%812/%E6%B7%A1%E8%93%9D%E8%89%B2%E9%A3%8E%E6%A0%BC1.png)


#PodUpdater

iOS开发中帮助您快速的将自己的开发的pod库代码上传到git，并帮你push到podspec repo库去
使用方式：cd到你的pod库代码目录，然后执行'pod_updater -v [new_version]',然后就可以去喝杯茶了

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pod_updater'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pod_updater

## Usage

cd to the path where your podspec project.

```
    cd ~/Desktop/my_private_pod/my_first_pod
    
```
then , run 'pod_updater -v 1.0.1' 

```
    pod_updater -v 1.0.1
```

There are some shell commands in my shell.

```
qwkdeMacBook-Pro-2:~ qwk$ cd ~/Documents/WZ_GitHub/WZ_HelloKit 

qwkdeMacBook-Pro-2:WZ_HelloKit qwk$ pod_updater -v 3.0.0

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pod_updater. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PodUpdater project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pod_updater/blob/master/CODE_OF_CONDUCT.md).


