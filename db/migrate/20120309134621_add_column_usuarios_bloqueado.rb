class AddColumnUsuariosBloqueado < ActiveRecord::Migration
  def self.up
     add_column :usuarios, :bloqueado, :boolean, :default => false
  end

  def self.down
     remove_column :usuarios, :bloqueado, :boolean
  end
end
