$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  
%w(dinheiro
dinheiro_util
dinheiro_active_record
excecoes
number_portuguese).each {|req| require File.dirname(__FILE__) + "/br_dinheiro/#{req}"}


require 'bigdecimal'
require 'rubygems'
require 'active_record'



String.send(:include, DinheiroUtil)
ActiveRecord::Base.send :include, DinheiroActiveRecord

module BrDinheiro  
end


class String
  def blank?
    return true if self && self == ""
    false
  end
end

class NilClass
  def blank?
    true
  end
end
