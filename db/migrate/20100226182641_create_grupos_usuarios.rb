class CreateGruposUsuarios < ActiveRecord::Migration
  def self.up
     create_table :grupos_usuarios do |t|
         t.integer :usuario_id
         t.integer :grupo_id
         t.timestamps
      end
      add_index :grupos_usuarios, :usuario_id
      add_index :grupos_usuarios, :grupo_id
   end

   def self.down
      drop_table :grupos_usuarios
   end
end
