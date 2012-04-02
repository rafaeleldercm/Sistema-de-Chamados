class AddColumnChamadosGrupoId < ActiveRecord::Migration
   def self.up
      add_column :chamados, :grupo_id, :integer
   end
 
   def self.down
      remove_column :chamados, :grupo_id
   end
end
