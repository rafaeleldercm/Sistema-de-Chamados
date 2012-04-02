class Chamado < ActiveRecord::Base
   has_many   :chamados
   has_many   :arquivos
   has_many   :mensagems
   
   belongs_to :grupo
   belongs_to :usuario
   belongs_to :sistema
   belongs_to :tipo_chamado
   belongs_to :atendente, :class_name => 'Usuario', :foreign_key => 'atendente_id'
   
   validates_presence_of :usuario_id, :sistema_id, :tipo_chamado_id
   
   def status_desc
      case self.status
         when 0 : 'Aberto'
         when 1 : 'Em Análise'
         when 2 : 'Em Desenvolvimento'
         when 3 : 'Em Atendimento'
         when 4 : 'Encerrado'
         when 5 : 'Aguardando DETRAN'
      end
   end

   def pode_reabrir?(usuario_id = 0)
      return false if self.status != 4
      retorno =  []
      retorno << (self.usuario_id ==   usuario_id)
      retorno << (self.atendente_id == usuario_id)

      return (retorno.include? true) 
   end
 
   def pode_responder?(usuario_id = 0)
      return false if self.status == 4
      retorno =  []
      retorno << (self.usuario_id ==   usuario_id)
      retorno << (self.atendente_id == usuario_id)

      return (retorno.include? true) 
   end
   
   def pode_encerrar?(usuario_id = 0)
      return false if self.status == 4
      retorno =  []
      retorno << (self.usuario_id ==   usuario_id)
      retorno << (self.atendente_id == usuario_id) 
      
      return ( retorno.include? true ) 
   end
   
   def pode_encaminhar?(usuario_id = 0)
      return false if self.status == 4
      return (self.atendente_id == usuario_id) 
   end
   
   def pode_atender?(usuario_id = 0)
      return false if self.status == 4
      users = []
      self.sistema.grupos_atendimento.each do |g|
         g.usuarios.each do |u|
            users << u.id 
         end
      end 
      return users.include? usuario_id
   end
   
end
