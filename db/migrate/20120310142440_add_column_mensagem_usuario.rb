class AddColumnMensagemUsuario < ActiveRecord::Migration
   def self.up
      add_column :mensagems, :usuario_id, :integer
   end
 
   def self.down
      remove_column :mensagems, :usuario_id
   end
end
