# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "psets"
set :repo_url, "git@vgl-ait.org:web18-17.git"
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :deploy_to, "/home/deploy/psets"


append :linked_files, "config/database.yml", "config/master.key"

append :linked_dirs, "log", "tmp", "public/system", ".bundle"

set :default_env, {'HTTP_PROXY'=>'192.41.170.23:3128',
                   'HTTPS_PROXY'=>'192.41.170.23:3128'}

set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :publishing, :restart
end
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
