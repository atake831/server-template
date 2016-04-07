system_user = 'prsys'
app_name = 'webapp'

rails_env = ENV['RAILS_ENV']

root_dir = "/data/#{system_user}/#{app_name}"
log_dir = "/data/#{system_user}/log"

pid_dir = File.join(root_dir, 'tmp/pids')
socket_dir = File.join(root_dir, 'tmp/sockets')
FileUtils.mkdir_p(pid_dir) unless FileTest.exist?(pid_dir)
FileUtils.mkdir_p(socket_dir) unless FileTest.exist?(socket_dir)

God.watch do |w|
    w.name = 'unicorn'
    w.interval = 3.seconds
    w.pid_file = File.join(pid_dir, 'unicorn.pid')
    w.env = { 'RAILS_ENV' => rails_env, 'BUNDLE_GEMFILE' => File.join(root_dir, 'Gemfile') }

    w.start = "cd #{root_dir} && bundle exec unicorn -c #{File.join(root_dir, "config/unicorn/#{rails_env}.rb")} -E #{rails_env} -D"
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

