class AddColumnUsuariosTelefone < ActiveRecord::Migration
  def self.up
     add_column :usuarios, :telefone, :string
  end

  def self.down
     remove_column :usuarios, :telefone
  end
end
