# -*- coding: utf-8 -*-
worker_processes (ENV['UNICORN_WORKER_PROCESSES'] || 4 ).to_i
timeout 30
preload_app true

current_dir = '/data/prsys/webapp'
working_directory current_dir


listen "#{current_dir}/tmp/sockets/unicorn.sock", backlog: 64
pid "#{current_dir}/tmp/pids/unicorn.pid"

# log
log_dir = '/data/prsys/log'
stderr_path File.expand_path('unicorn.err', log_dir)
stdout_path File.expand_path('unicorn.log', log_dir)

before_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

    old_pid = "#{server.config[:pid]}.oldbin"
    unless old_pid == server.pid
        begin
            sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU 
            Process.kill(sig, File.read(old_pid).to_i)
        rescue Errno::ENOENT, Errno::ESRCH
        end
    end
end


after_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

before_exec do |_|
    ENV['BUNDLE_GEMFILE'] = "#{current_dir}/Gemfile"
end

