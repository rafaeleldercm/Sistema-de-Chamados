class AddColumnChamadosStatus < ActiveRecord::Migration
   def self.up
      add_column :chamados, :status, :integer, :default => 0
      add_index :chamados, :status
   end
 
   def self.down
      remove_column :chamados, :status
   end
end
