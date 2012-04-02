class InsertAdminUser < ActiveRecord::Migration
  def self.up
      execute "insert into usuarios (login,name,email,crypted_password) 
                      values ('admin','admin','admin@admin.com.br','aa7bc8cd8d2bad6d421740076fdebff889820147');"
  end

  def self.down
     execute "delete usuarios where login = 'admin';"
  end
end
