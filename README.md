# server-template

itamae-rails
https://github.com/atake831/itamae-rails

と一緒に使うこと前提。

god + unicorn + nginx + rails
の環境が整う。

その、雛形。

## Usage

```
bundle install
bundle exec rake db:migrate
bundle exec god -c config/god/development.rb
bundle exec god start unicorn
```

神の使い方
```
bundle exec god start unicorn
bundle exec god stop unicorn
bundle exec god restart unicorn
```

神の止め方
```
bundle exec god terminate
```


### unicorn

``` 
config/unicorn/development.rb
config/unicorn/production.rb
```

current_dir, log_dirあたりはよしなに。

