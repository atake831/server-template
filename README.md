# server-template

itamae-rails
https://github.com/atake831/itamae-rails

と一緒に使うと幸せになれる。

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

```
bundle exec god stop unicorn
```

```
bundle exec god terminate
```


