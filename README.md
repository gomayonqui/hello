# Hello

We want enjoyable Rails authentication

__This gem is in rapid development, can be used in production by Rails experts__

* Share Experiences: https://gitter.im/hello-gem/hello





## Status

[![Build Status](https://travis-ci.org/hello-gem/hello.svg?branch=master)](https://travis-ci.org/hello-gem/hello)

[![Code Climate](https://codeclimate.com/github/hello-gem/hello.png)](https://codeclimate.com/github/hello-gem/hello)

[![Code Climate](https://codeclimate.com/github/hello-gem/hello/coverage.png)](https://codeclimate.com/github/hello-gem/hello)

[![Dependency Status](https://gemnasium.com/hello-gem/hello.svg)](https://gemnasium.com/hello-gem/hello)

[![Inline docs](http://inch-ci.org/github/hello-gem/hello.png?branch=master)](http://inch-ci.org/github/hello-gem/hello)






## References

* Home page: https://github.com/hello-gem/hello
* API Doc: https://github.com/hello-gem/hello
* Version: https://github.com/hello-gem/hello
* Trello Board: https://trello.com/b/WwNptyVM/hello-gem

## Support

* Bugs/Issues: https://github.com/hello-gem/hello/issues
* Support: http://stackoverflow.com/questions/tagged/hello
* Support/Chat: [![Gitter chat](https://badges.gitter.im/hello-gem/hello.png)](https://gitter.im/hello-gem/hello)

## Requirements and Compatibility

* Ruby 1.9+
* Rails 4.0+

## Demo

Want to see it in action?

* Visit https://bit.ly/hellogem
* Sources at https://github.com/hello-gem/hello_demo






## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hello', github: 'hello-gem/hello' # latest from github while this gem is in rapid development
```

And then execute:

```bash
bundle
rails g hello:install
rake db:migrate
rails g hello:views # optional
```

## Customizing - behavior and views

These files are generated when you install this gem.
They are simple to customize, just open them

    + app/
    | + lib/
    | | + hello/
    | |   - sign_up.rb
    | |   - sign_in.rb
    | |   - sign_out.rb
    | |   - forgot.rb
    | |   - reset.rb
    | + view/
    |   + hello/
    |       ...







## Usage

TODO: review usage instructions

You only need to include our module in your User class

```ruby
class User < ActiveRecord::Base
  include Hello::UserModel

  # uncomment the line below if you want username
  # validates_presence_of :username

end
```

We let you customize everything

```ruby
class Credential < ActiveRecord::Base
  include Hello::CredentialModel

  def encrypt_password(plain_text_password)
    BCrypt::Password.create(plain_text_password)
  end

end
```








# Thank You

[Tim Lucas](https://github.com/toolmantim), [John Nunemaker](https://github.com/jnunemaker), [Dan Everton](https://github.com/deverton) and [Johan Andersson](https://github.com/rejeep) or their open source gem [user_agent_parser](https://github.com/toolmantim/user_agent_parser). As well as [Tobie Langel](https://github.com/tobie) and everybody involved in [BrowserScope](http://www.browserscope.org/) ([full list](https://code.google.com/p/browserscope/people/list)), as our device and browser detection derives from their open-source work.

[Iain Hecker](https://github.com/iain) for his open source gem [http_accept_language](https://github.com/iain/http_accept_language) that helps us understand browser's favorite locales.






## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Versioning

__Hello__ uses [Semantic Versioning 2.0.0](http://semver.org)

## Copyright

Copyright 2013-2014 James Pinto – Released under [MIT License](http://www.opensource.org/licenses/MIT)
