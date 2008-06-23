$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'active_support'
  
%w(feriado
feriado_parser
version
excecoes).each {|req| require File.dirname(__FILE__) + "/brferiado/#{req}"}


module BrFeriado 
end

# FERIADOS_PATH = RAILS_ROOT + '/config/feriados'
feriados, metodos = FeriadoParser.parser(File.dirname(__FILE__) + "/brferiado/config")
# if File.directory?(FERIADOS_PATH)
#   f, m = FeriadoParser.parser(FERIADOS_PATH)
#   feriados += f
#   metodos += m
# end
Date::FERIADOS = feriados;
Date::FERIADOS_METODOS = metodos
