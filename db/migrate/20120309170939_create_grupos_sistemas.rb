class CreateGruposSistemas < ActiveRecord::Migration
   def self.up
     create_table :grupos_sistemas do |t|
         t.integer :grupo_id
         t.integer :sistema_id
         t.timestamps
      end
      add_index :grupos_sistemas, :grupo_id
      add_index :grupos_sistemas, :sistema_id
      
      execute "ALTER TABLE grupos_sistemas DROP CONSTRAINT grupos_sistemas_pkey;"
      execute "ALTER TABLE grupos_sistemas ADD CONSTRAINT grupos_sistemas_pkey PRIMARY KEY (grupo_id, sistema_id);"
      remove_column :grupos_sistemas, :id
   end
   
   def self.down
      drop_table :grupos_sistemas
   end
   
end
