class CreateGrupos < ActiveRecord::Migration
  def self.up
    create_table :grupos do |t|
      t.string :nome
      t.boolean :master

      t.timestamps
    end
  end

  def self.down
    drop_table :grupos
  end
end
