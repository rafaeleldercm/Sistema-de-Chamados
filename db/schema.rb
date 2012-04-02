# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120313121722) do

  create_table "arquivos", :force => true do |t|
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.string   "arquivo_file_size"
    t.integer  "chamado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "arquivos", ["chamado_id"], :name => "index_arquivos_on_chamado_id"

  create_table "chamados", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "sistema_id"
    t.integer  "tipo_chamado_id"
    t.integer  "atendente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",          :default => 0
    t.integer  "grupo_id"
  end

  add_index "chamados", ["status"], :name => "index_chamados_on_status"

  create_table "grupos", :force => true do |t|
    t.string   "nome"
    t.boolean  "master"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "atendente",  :default => false
  end

  create_table "grupos_sistemas", :id => false, :force => true do |t|
    t.integer  "grupo_id",   :null => false
    t.integer  "sistema_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grupos_sistemas", ["grupo_id"], :name => "index_grupos_sistemas_on_grupo_id"
  add_index "grupos_sistemas", ["sistema_id"], :name => "index_grupos_sistemas_on_sistema_id"

  create_table "grupos_usuarios", :id => false, :force => true do |t|
    t.integer  "usuario_id", :null => false
    t.integer  "grupo_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grupos_usuarios", ["grupo_id"], :name => "index_grupos_usuarios_on_grupo_id"
  add_index "grupos_usuarios", ["usuario_id"], :name => "index_grupos_usuarios_on_usuario_id"

  create_table "mensagems", :force => true do |t|
    t.integer  "chamado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "descricao"
    t.integer  "usuario_id"
    t.integer  "chamado_status"
  end

  create_table "sessions", :force => true do |t|
    t.text     "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sistemas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ativo",      :default => true
  end

  create_table "sistemas_tipo_chamados", :force => true do |t|
    t.integer "sistema_id",      :null => false
    t.integer "tipo_chamado_id", :null => false
  end

  add_index "sistemas_tipo_chamados", ["sistema_id"], :name => "index_sistemas_tipo_chamados_on_sistema_id"
  add_index "sistemas_tipo_chamados", ["tipo_chamado_id"], :name => "index_sistemas_tipo_chamados_on_tipo_chamado_id"

  create_table "tipo_chamados", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "telefone"
    t.boolean  "bloqueado",                                :default => false
  end

  add_index "usuarios", ["login"], :name => "index_usuarios_on_login", :unique => true

end
