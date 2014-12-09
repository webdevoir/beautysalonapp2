set :application, 'beautysalon'
set :repo_url, 'git@github.com:acandael/beautysalonapp2.git'

set :deploy_to, '/opt/www/beautysalon'
set :user, 'deploy'
set :branch, ENV['BRANCH'] || "master"

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :keep_releases, 5

namespace :deploy do
  %w[start stop restart].each do |command|
      desc 'Manage Unicorn'
      task command do
        on roles(:app), in: :sequence, wait: 1 do
          execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
        end      
      end
    end
  
  after :publishing, :restart 

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache_clear'
      # end
    end
  end
end
