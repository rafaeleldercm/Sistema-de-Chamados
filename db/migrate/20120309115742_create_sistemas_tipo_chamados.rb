class CreateSistemasTipoChamados < ActiveRecord::Migration
   def self.up
      create_table :sistemas_tipo_chamados do |t|
         t.integer :sistema_id
         t.integer :tipo_chamado_id

         t.timestamps
      end
      add_index :sistemas_tipo_chamados, :sistema_id
      add_index :sistemas_tipo_chamados, :tipo_chamado_id
   end

   def self.down
     drop_table :sistemas_tipo_chamados
   end
end
