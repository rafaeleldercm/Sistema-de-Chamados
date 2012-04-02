class InsertUserOnAdminGrupo < ActiveRecord::Migration
  def self.up
     execute "INSERT INTO grupos_usuarios(usuario_id, grupo_id) VALUES (1,1);
              SELECT setval('public.grupos_usuarios_id_seq', 2, true);"

  end

  def self.down
     execute 'delete grupos_usuarios usuario_id = 1 and grupo_id = 1;'
  end
end
