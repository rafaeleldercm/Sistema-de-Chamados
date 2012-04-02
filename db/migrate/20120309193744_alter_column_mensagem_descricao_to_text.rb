class AlterColumnMensagemDescricaoToText < ActiveRecord::Migration
  def self.up
     remove_column :mensagems, :descricao
     add_column :mensagems, :descricao, :text
  end

  def self.down
     remove_column :mensagems, :descricao
     add_column :mensagems, :descricao, :text
  end
end
