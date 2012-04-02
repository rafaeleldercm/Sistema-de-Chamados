class CreateArquivos < ActiveRecord::Migration
   def self.up
     create_table :arquivos do |t|
         t.string  :arquivo_file_name 
         t.string  :arquivo_content_type 
         t.string  :arquivo_file_size 
         t.integer :chamado_id
         t.timestamps
      end
      add_index :arquivos, :chamado_id
   end
 
   def self.down
      drop_table :arquivos
   end
end
