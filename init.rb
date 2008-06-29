PROJECTS = %w(brcep brdata brtraducao brnumeros brstring brdinheiro)

PROJECTS.each do |project|
  require "#{File.dirname(__FILE__)}/#{project}/rails/init"
end
