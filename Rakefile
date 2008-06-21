require 'rake'
require 'rake/rdoctask'
require 'rake/contrib/sshpublisher'

env = %(PKG_BUILD="#{ENV['PKG_BUILD']}") if ENV['PKG_BUILD']

PROJECTS = %w(br_dinheiro)

Dir["#{File.dirname(__FILE__)}/*/lib/*/version.rb"].each do |version_path|
  require version_path
end

desc 'Run all tests by default'
task :default => :test

%w(test rdoc package release).each do |task_name|
  desc "Run #{task_name} task for all projects"
  task task_name do
    PROJECTS.each do |project|
      system %(cd #{project} && #{env} #{$0} #{task_name})
    end
  end
end


desc "Generate documentation for the Rails framework"
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = "Brazilian Rails Documentation"

  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.options << '-A cattr_accessor=object'
  rdoc.options << '--charset' << 'utf-8'

  rdoc.template = "#{ENV['template']}.rb" if ENV['template']

  rdoc.rdoc_files.include('br_dinheiro/README')
  rdoc.rdoc_files.include('br_dinheiro/CHANGELOG')
  rdoc.rdoc_files.include('br_dinheiro/lib/**/*.rb')

end

# desc "Publish API docs for Rails as a whole and for each component"
# task :pdoc => :rdoc do
#   Rake::SshDirPublisher.new("wrath.rubyonrails.org", "public_html/api", "doc").upload
#   PROJECTS.each do |project|
#     system %(cd #{project} && #{env} #{$0} pdoc)
#   end
# end
