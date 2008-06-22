$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  
%w(feriado
feriado_parser
version
excecoes).each {|req| require File.dirname(__FILE__) + "/brferiado/#{req}"}


module BrFeriado 
end