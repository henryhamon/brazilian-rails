$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'  
require 'action_controller'
require 'html/document'
require 'active_support'
require 'action_view'

  
%w(busca_endereco
version
br_form_options_helper).each {|req| require File.dirname(__FILE__) + "/brcep/#{req}"}


module BrCep
end