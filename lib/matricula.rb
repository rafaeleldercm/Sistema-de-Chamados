require 'net/http'
require 'rubygems'

module Matricula
  def gera_matricula
    http = Net::HTTP.new('www.demaria.com.br', 80)
    path = '/novamatricula'
    
    begin 
       data = "campo_acao=gera_dvs&campo_codigo=#{self.cartorio.codigo_nacional_serventia}&campo_acervo=#{self.tipo_de_acervo}&campo_rcpn=55&campo_ano=#{self.data_registro.year}&campo_ato=#{self.tipo_do_livro}&campo_livro=#{self.numero_do_livro}&campo_folha=#{self.numero_da_folha}&campo_registro=#{self.numero_do_termo}"

       headers = {
         'Referer' => 'http://www.demaria.com.br/novamatricula',
         'Content-Type' => 'application/x-www-form-urlencoded'
       }

       resp, data = http.post(path, data, headers)
       s = data.to_s.split("<div id='matricula' align='center'  class='matricula'>")[1].split("<")[0].gsub(" ","")
       self.numero_matricula = s
     rescue
        return false
     end
  end
end
