class RemoveColumnGruposUsuariosId < ActiveRecord::Migration
   def self.up
      remove_column :grupos_usuarios, :id
   end
 
   def self.down
      add_column :grupos_usuarios, :id, :integer
   end
end
