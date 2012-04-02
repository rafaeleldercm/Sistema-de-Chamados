class CreateMensagems < ActiveRecord::Migration
  def self.up
    create_table :mensagems do |t|
      t.string :descricao
      t.references :chamado

      t.timestamps
    end
  end

  def self.down
    drop_table :mensagems
  end
end
