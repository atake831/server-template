system_user = 'prsys'
app_name = 'webapp'

rails_env = ENV['RAILS_ENV']

root_dir = Pathname.new("/data/#{system_user}/#{app_name}")
log_dir = Pathname.new("/data/#{system_user}/log")

God.watch do |w|
    w.name = 'unicorn'
    w.interval = 3.seconds
    w.pid_file = root_dir.join('/tmp/pids/unicorn.pid')
    w.env = { 'RAILS_ENV' => rails_env, 'BUNDLE_GEMFILE' => root_dir.join('Gemfile') }

    w.start = "cd #{root_dir} && bundle exec unicorn -c #{root_dir.join("config/unicorn/#{rails_env}.rb")} -E #{rails_env} -D"
    w.stop = "kill -QUIT `cat #{w.pid_file}`"
    w.restart = "kill -USR2 `cat #{w.pid_file}`"

    w.start_grace = 10.seconds
    w.restart_grace = 10.seconds

    w.keepalive
    w.behavior(:clean_pid_file)

    w.start_if do |start|
        start.condition(:process_running) do |c|
            c.interval = 5.seconds
            c.running = false
        end
    end
end

