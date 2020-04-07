set :application, 'redmine'
set :repo_url,  "git@github.com:Danissss/redmine.git"
set :deploy_to, '/apps/redmine/project'
set :use_sudo, false
set :linked_files, ['config/database.yml', 'config/setting.yml']
# set :linked_dirs, %w{public/downloads log public/system data}
set :keep_releases, 2

namespace :deploy do
  desc 'Start application'
  task :start do
    on roles(:web) do
      within release_path do
        execute "script/puma.sh", "start"
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:web) do
      within release_path do
        execute "script/puma.sh", "stop"
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:web) do
      within release_path do
        execute "script/puma.sh", "restart"
      end
    end
  end

  after :publishing, :restart, :cleanup
end
