class AddColumnSistemaAtivo < ActiveRecord::Migration
  def self.up
     add_column :sistemas, :ativo, :boolean, :default => true
  end

  def self.down
     remove_column :sistemas, :ativo
  end
end
