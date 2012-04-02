class AddColumnGrupoAtendente < ActiveRecord::Migration
   def self.up
      add_column :grupos, :atendente, :boolean, :default => false
   end
 
   def self.down
      remove_column :grupos, :atendente
   end
end
