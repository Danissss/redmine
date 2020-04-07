set :stage, :production
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

role :app, %w{redmine@174.138.47.251}
role :web, %w{redmine@174.138.47.251}
role :db,  %w{redmine@174.138.47.251}