class Sistema < ActiveRecord::Base
   
   has_and_belongs_to_many :tipo_chamados
   has_and_belongs_to_many :grupos   
      
   def grupos_atendimento
      self.grupos.all(:conditions => "atendente is true")
   end   

   def abertos
      Chamado.all(:conditions => "sistema_id = #{self.id} and status = 0")
   end

   def atendimento
      Chamado.all(:conditions => "sistema_id = #{self.id} and status not in (0,4)")
   end
end
