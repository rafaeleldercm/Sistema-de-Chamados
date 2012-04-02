class ChangePrimaryKeyFromUsuariosGrupos < ActiveRecord::Migration
  def self.up
     execute "ALTER TABLE grupos_usuarios DROP CONSTRAINT grupos_usuarios_pkey;"
     execute "ALTER TABLE grupos_usuarios ADD CONSTRAINT usuario_grupo_id PRIMARY KEY (usuario_id, grupo_id);"
  end

  def self.down
     execute "ALTER TABLE grupos_usuarios DROP CONSTRAINT usuario_grupo_id;";
  end
end
