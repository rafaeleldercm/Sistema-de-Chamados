class Grupo < ActiveRecord::Base
   
   has_and_belongs_to_many :usuarios
   has_and_belongs_to_many :sistemas

   has_many :chamados   
end
