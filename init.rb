%w(feriado 
feriado_parser 
active_record_portuguese
action_view_portuguese
date_portuguese
time_portuguese
dinheiro
dinheiro_util
excecoes
nil_class
number_portuguese
string_portuguese
dinheiro_active_record
busca_endereco).each {|req| require req}

old_verbose = $VERBOSE
$VERBOSE = nil
[Time, Date].each do |clazz|
  eval "#{clazz}::MONTHNAMES = [nil] + %w(Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro)"
  eval "#{clazz}::DAYNAMES = %w(Domingo Segunda-Feira Terça-Feira Quarta-Feira Quinta-Feira Sexta-Feira Sábado)"
  eval "#{clazz}::ABBR_MONTHNAMES = [nil] + %w(Jan Fev Mar Abr Mai Jun Jul Ago Set Out Nov Dez)"
  eval "#{clazz}::ABBR_DAYNAMES = %w(Dom Seg Ter Qua Qui Sex Sab)"
end

$VERBOSE = old_verbose
