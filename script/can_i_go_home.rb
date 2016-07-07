def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text)
  colorize(text, 31)
end

def green(text)
  colorize(text, 32)
end

repos_with_uncommited_changes = []
repos_with_unpushed_changes = []

Dir.chdir('/home/vagrant') do
  #.collect {|repo| repo.split('/')[1]}

  git_repos = `find -maxdepth 2 -type d -name .git`.split("\n").collect{|repo| repo.gsub('/.git', '')}
  git_repos.each do |git_repo|
    Dir.chdir("/home/vagrant/#{git_repo}") do
      repos_with_uncommited_changes << git_repo unless `git status --porcelain`.empty?
      repos_with_unpushed_changes << git_repo unless `git log --branches --not --remotes`.empty?
    end
  end
end

if repos_with_uncommited_changes.empty? && repos_with_unpushed_changes.empty?
  puts green 'Yes. Peace Out!'
else
  puts red 'Nooooooooooooo.......'
  puts red "The following repos have UNCOMMITED changes [#{repos_with_uncommited_changes.collect{|repo| repo.gsub('./', '')}.join ','}]" unless repos_with_uncommited_changes.empty?
  puts red "The following repos have UNPUSHED changes [#{repos_with_unpushed_changes.collect{|repo| repo.gsub('./', '')}.join ','}]" unless repos_with_unpushed_changes.empty?
end


