class RemoveSistemaTipoChamadosCreatedUpdate < ActiveRecord::Migration
  def self.up
     remove_column :sistemas_tipo_chamados, :created_at
     remove_column :sistemas_tipo_chamados, :updated_at
  end

  def self.down
     add_column :sistemas_tipo_chamados, :created_at, :timestamp
     add_column :sistemas_tipo_chamados, :updated_at, :timestamp
  end
end
