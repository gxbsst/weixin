set :deploy_via, :remote_cache

set :application, "wx.sidways.com"

set :branch, "master"
 set :repository,  "git://github.com/gxbsst/weixin.git"

set :scm, :git

set :default_environment, {
  'PATH' => "/home/deployer/.rbenv/versions/1.9.3-p448/bin/:$PATH"
}
server "cancer", :web, :app, :db, primary: true
set :branch, "master"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do

  task :setup_config, roles: :app do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    put File.read("config/app_config.example.yml"), "#{shared_path}/config/app_config.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/app_config.yml #{release_path}/config/app_config.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

end
