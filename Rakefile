require 'rake'
require 'rake/rdoctask'
require 'rake/contrib/sshpublisher'

env = %(PKG_BUILD="#{ENV['PKG_BUILD']}") if ENV['PKG_BUILD']

PROJECTS = %w(brdinheiro brcep brdata brtraducao brnumeros brstring)

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
  rdoc.options << '-T html'
  rdoc.options << '--all'
  rdoc.options << '-U'
  

  rdoc.template = "#{ENV['template']}.rb" if ENV['template']
  
  rdoc.rdoc_files.include("README.mkdn")
  
  PROJECTS.each do |project|
    rdoc.rdoc_files.include("#{project}/README")
    rdoc.rdoc_files.include("#{project}/CHANGELOG")
    rdoc.rdoc_files.include("#{project}/lib/**/*.rb")
  end
  
end

task :rdoc do
  Rake::Task["generate_doc"].invoke 
end


# desc "Publish API docs for Rails as a whole and for each component"
# task :pdoc => :rdoc do
#   Rake::SshDirPublisher.new("wrath.rubyonrails.org", "public_html/api", "doc").upload
#   PROJECTS.each do |project|
#     system %(cd #{project} && #{env} #{$0} pdoc)
#   end
# end


task :generate_doc do
  plugin_path = File.expand_path(File.dirname(__FILE__))
  bin_path = "#{plugin_path}/bin"
  doc_path = "#{plugin_path}/doc"
  file = "#{doc_path}/files/README_mkdn.html"
  sh "chmod +x #{bin_path}/bluecloth"
  sh "#{bin_path}/bluecloth README.mkdn > #{file}"
  
  index = File.read(file)
  index.gsub!(/<html>/, 
    %{<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
      <html xmlns="http://www.w3.org/1999/xhtml">
    })

  index.gsub!(/<head>(.*?)<\/head>/, 
    %{<head>
        <title>Brazilian Rails</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="stylesheets/screen.css" type="text/css" media="screen" />
      </head>
    })
  
  index.gsub!(/<\/body>/, 
      %{
        <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
        var pageTracker = _gat._getTracker("UA-3959259-1");
        pageTracker._initData();
        pageTracker._trackPageview();
        </script>
        </body>
        })
  
  File.open(file, 'w+') do |index_file|
    index_file << index
  end
end