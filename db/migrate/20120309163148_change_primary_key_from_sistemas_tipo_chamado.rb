class ChangePrimaryKeyFromSistemasTipoChamado < ActiveRecord::Migration
  def self.up
     execute "ALTER TABLE sistemas_tipo_chamados DROP CONSTRAINT sistemas_tipo_chamados_pkey;"
     execute "ALTER TABLE sistemas_tipo_chamados ADD CONSTRAINT sistemas_tipo_chamados_id_id PRIMARY KEY (sistema_id, tipo_chamado_id);"
  end

  def self.down
     execute "ALTER TABLE sistemas_tipo_chamados DROP CONSTRAINT sistemas_tipo_chamados_id_id;"
  end
end
