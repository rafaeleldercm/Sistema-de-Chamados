class AddGrupoAtendenteAndCliente < ActiveRecord::Migration
  def self.up
     execute "insert into grupos (nome) values ('Atendente');
              insert into grupos (nome) values ('Cliente');"
  end

  def self.down
     execute "delete grupos where nome = 'Atendente';
              delete grupos where nome = 'Cliente';"
  end
end
