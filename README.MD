# Download Gists in Ruby

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/7ecb85567294485f91f071d70cc435fa)](https://app.codacy.com/gh/PartTimeLegend/gist_list_ruby?utm_source=github.com&utm_medium=referral&utm_content=PartTimeLegend/gist_list_ruby&utm_campaign=Badge_Grade)

## Tested Tool Builds

| Tool | Version | Source|
| ----------- | ----------- | ----------- |
| Ruby | 2.7.0 | https://www.ruby-lang.org/ |
| Bundler | 2.1.4 | https://bundler.io/ |
| Json | 2.3.0 | https://rubygems.org/gems/json/ |
| open-uri | 2.0.0 | Bundled with Ruby |
| FileUtils | 1.4.1 | https://rubygems.org/gems/fileutils |

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