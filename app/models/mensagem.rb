class Mensagem < ActiveRecord::Base
   belongs_to    :chamado
   belongs_to    :usuario
    
   after_create  :atualiza_status_chamado

   def atualiza_status_chamado
      if self.chamado_status.nil?
         self.chamado_status = 0 
         self.save
      end
      chamado        = self.chamado
      chamado.status = self.chamado_status
      chamado.save
   end
   private:atualiza_status_chamado

   def chamado_status_desc
      self.status(self.chamado_status)
   end
   
   def status(id)
      case id
         when 0 : 'Aberto'
         when 1 : 'Em Análise'
         when 2 : 'Em Desenvolvimento'
         when 3 : 'Em Atendimento'
         when 4 : 'Encerrado'
         when 5 : 'Aguardando DETRAN'
      end
   end

   def select_status(usuario_id)
      retorno = []
      retorno << [self.chamado_status_desc + ' - Atual', self.chamado_status]

      if self.chamado.pode_atender? (usuario_id) 
         for i in 0..5 do 
            retorno << [self.status(i),i]  if i != self.chamado_status
         end
      end
      return retorno
   end

   def attr_chamado_id=(params)
      self.chamado_id     = params
      self.chamado_status = self.chamado.status
   end
end
