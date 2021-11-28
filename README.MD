# Download Gists in Ruby

![Ruby](https://github.com/PartTimeLegend/gist_list_ruby/workflows/Ruby/badge.svg)

## Tested Tool Builds

| Tool | Version | Source|
| ----------- | ----------- | ----------- |
| Ruby | 3.0.3 | https://www.ruby-lang.org/ |
| Bundler | 2.2.17 | https://bundler.io/ |
| Json | 2.5.1 | https://rubygems.org/gems/json/ |
| open-uri | 2.0.0 | Bundled with Ruby |
| FileUtils | 1.5.0 | https://rubygems.org/gems/fileutils |

## Usage
### bundler
```bash
$ gem install bundler
````
```bash
$ bundler install
```

### Executing the script
```bash
$ ruby getGists.rb <username>
```

## Known issues

### 403 rate limit exceeded
If you get this it is because your client has made too many requests to the API endpoint. Unfortunately as there is no account credentials passed this may occur on more active users.

### Downloaded all the gists for parttimelegend
You didn't specify a username and it failed back to parttimelegend
```ruby
username = "parttimelegend" if ARGV[0].nil?
```

### Slow to run
Ruby is a scripting language without a compiler and runs slowly on Windows.

## Future improvements
* Allow user to specify API key
