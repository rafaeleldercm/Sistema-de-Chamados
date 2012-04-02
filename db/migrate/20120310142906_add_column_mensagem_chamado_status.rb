class AddColumnMensagemChamadoStatus < ActiveRecord::Migration
   def self.up
      add_column :mensagems, :chamado_status, :integer
   end

   def self.down
      remove_column :mensagems, :chamado_status
   end
end
