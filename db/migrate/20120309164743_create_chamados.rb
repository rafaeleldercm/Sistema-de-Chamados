class CreateChamados < ActiveRecord::Migration
  def self.up
    create_table :chamados do |t|
      t.references :usuario
      t.references :sistema
      t.references :tipo_chamado
      t.integer :atendente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chamados
  end
end
