namespace :bundle do
  namespace :install do
    desc 'Bundle install in all projects'
    task :all do
      execute_bundle_command(Repositories::BUNDLED, 'install --path vendor/bundle --clean')
    end
  end
end