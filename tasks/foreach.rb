desc 'run any command for all the repos'
task :foreach do
  ARGV.shift  # throw away foreach
  execute_command_for_each(Repositories::ALL, ARGV.join(' '))
end

desc 'run any command for DB repos'
namespace :db do
  task :foreach do
    ARGV.shift  # throw away foreach
    execute_command_for_each(Repositories::REPOSITORIES_WITH_DB, ARGV.join(' '))
  end
end