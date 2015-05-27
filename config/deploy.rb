lock '3.4.0'

set :application, 'devkg'
set :repo_url, 'git@github.com:spalmalo/dev.kg.git'

set :deploy_to, "/opt/#{ fetch :application }"


set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp')
set :linked_files, fetch(:linked_files, []).push('.env')

set :foreman_template, 'upstart'
set :foreman_export_path, "/etc/init"
set :foreman_options, {
  app: fetch(:application),
  root: current_path
}

namespace :deploy do
  task :restart do
    on roles(:app) do |host|
      f = "#{ fetch :foreman_export_path }/#{ fetch(:foreman_options)[:app] }.conf"
      if test("[ -f #{f} ]")
        invoke 'foreman:restart'
      else
        invoke 'foreman:setup'
      end
    end
  end

  desc "Upload .env.production"
  task :upload_env do
    on roles(:all) do
      upload! ".env.#{ fetch :stage }", "#{ shared_path }/.env.#{ fetch :stage }"
    end
  end

  desc "Fix file permissions"
  task :fix_file_permissions do
    on roles(:app) do
      "chown -R #{ fetch :application } #{shared_path}/tmp"
      "chown -R #{ fetch :application } #{shared_path}/log"
      "chown -R #{ fetch :application } #{current_path}/public/uploads"
    end
  end

  task :check_env do
    on roles(:all) do |host|
      f = "#{ shared_path }/.env"
      if test("[ -f #{f} ]")
        info "#{f} already exists on #{host}!"
      else
        execute "echo 'RAILS_ENV=#{ fetch :stage }' > #{f}"
        execute "echo 'PATH=/usr/local/rvm/wrappers/ruby-2.2.0:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> #{f}"
      end
    end

    on roles(:all) do |host|
      f = "#{ shared_path }/.env.#{ fetch :stage }"
      if test("[ -f #{f} ]")
        info "#{f} already exists on #{host}!"
      else
        invoke "deploy:upload_env"
      end
    end
  end

  # before 'check:linked_files', :upload_env
  before 'check:linked_files', :check_env
  after :publishing, :fix_file_permissions
  after :publishing, :restart # this line will fail on first deploy. Run foreman:setup and try to deploy again

end
