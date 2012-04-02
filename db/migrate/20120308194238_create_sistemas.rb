class CreateSistemas < ActiveRecord::Migration
  def self.up
    create_table :sistemas do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :sistemas
  end
end
