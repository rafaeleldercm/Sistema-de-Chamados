class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout "default"
  require 'brazilian-rails'
  include AuthenticatedSystem
  before_filter :login_required
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  #metodos auxiliares - ver se usa uma lib

private
   def data_valida?(texto)
      expr = begin
         texto.to_date
         true
         rescue
         false
      end
   end

   def data_por_extenso(data, esconder_dia = false)
      dia = data.day.to_s
      mes = case data.month 
             when 1: 'JANEIRO'  
             when 2: 'FEVEREIRO'
             when 3: 'MARCO'
             when 4: 'ABRIL'
             when 5: 'MAIO'
             when 6: 'JUNHO'
             when 7: 'JULHO'
             when 8: 'AGOSTO'
             when 9: 'SETEMBRO'
             when 10: 'OUTUBRO'
             when 11: 'NOVEMBRO'
             when 12: 'DEZEMBRO'
      end
      ano = data.year.to_s
      if esconder_dia then
         data = mes + ' DE ' + ano
      else
         data = dia + ' DE ' + mes + ' DE ' + ano
      end 
   end
end
