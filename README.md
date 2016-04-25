# server-template

itamae-rails
https://github.com/atake831/itamae-rails

と一緒に使うこと前提。

god + unicorn + nginx + rails
の環境が整う。

その、雛形。

## Usage

.env.templateを元に.envを作成、編集

```
bundle install
bundle exec rake db:migrate
god -c config/god/development.rb
god start unicorn
```

### doc

```
AUTODOC=1 bundle exec rspec
```

### god

神の使い方
```
god start unicorn
god stop unicorn
god restart unicorn
```

神の止め方
```
god terminate
```


### unicorn

``` 
config/unicorn/development.rb
config/unicorn/production.rb
```

current_dir, log_dirあたりはよしなに。

### unicorn

apiを確認する時は/etc/hostsに以下を追記する

```
127.0.0.1       example.com
127.0.0.1       api.example.com
```

