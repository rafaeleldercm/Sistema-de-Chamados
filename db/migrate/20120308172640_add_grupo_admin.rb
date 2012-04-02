class AddGrupoAdmin < ActiveRecord::Migration
  def self.up
     execute "insert into grupos (nome, master) values ('Administrador', true);"
  end

  def self.down
     execute "delete grupos where nome = 'Administrador' and master is true;"
  end
end
