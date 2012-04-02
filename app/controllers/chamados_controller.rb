class ChamadosController < ApplicationController
  before_filter :login_required
  before_filter :monta_select, :only => [:new, :edit, :create, :update]
  before_filter :mensagem_new, :only => [:new, :edit, :create, :update]
  
  def mensagem_new
     @mensagem = Mensagem.new
  end
  
  def get_tipo_chamado
     if !params[:id].blank? and params[:id].to_i > 0
        @tipo_chamados = Sistema.find(params[:id]).tipo_chamados 
     else 
        @tipo_chamados = []
     end
     render :layout => false
  end

  def acompanhamento
     @sistemas = Sistema.find_all_by_ativo(true)
  end  

  def todos
     @chamados = Chamado.paginate(:conditions => ["sistema_id in (?)", @current_usuario.sistemas_atendimento.collect{|s| s.id }],
                                  :order => 'updated_at desc', :page => params[:page] )
  end

  def abertos
     @chamados = Chamado.paginate(:conditions => ["status = ? and sistema_id in (?)", 0, @current_usuario.sistemas_atendimento.collect{|s| s.id }], 
                                  :order => 'updated_at desc', :page => params[:page] )
  end
 
  def em_atendimento
     @chamados = Chamado.paginate(:conditions => ["status not in (?,?) and sistema_id in (?)", 0, 4, @current_usuario.sistemas_atendimento.collect{|s| s.id }], :order => 'updated_at desc', :page => params[:page] )
  end
  
  def meus_pendentes
     @chamados = Chamado.paginate(:conditions => ["status <> ? and atendente_id =  ?", 4, @current_usuario.id],
                                  :order => 'updated_at desc', :page => params[:page] )
  end

  def grupo_pendentes
     @chamados = Chamado.paginate(:conditions => ["status <> ? and grupo_id in (?)", 4, @current_usuario.grupos.collect{|g| g.id }],
                                  :order => 'updated_at desc',:page => params[:page])
  end

  def atender
     chamado = Chamado.find(params[:id])
     chamado.atendente = @current_usuario
     @current_usuario.grupos.all(:conditions => "atendente is true").each do |g|
        if chamado.sistema.grupos_atendimento.include? g
           chamado.grupo = g 
           chamado.save
           break
        end
     end
     redirect_to :action => :show, :id => chamado.id
     return
  end

  def reabrir
     chamado = Chamado.find(params[:id])
     chamado.status = 0
     chamado.save
     redirect_to :action => :show, :id => chamado.id
     return
  end

  def encaminhar
     @chamado    = Chamado.find(params[:id])
     @grupos  = @chamado.sistema.grupos_atendimento.collect { |g| [g.nome, g.id] }
     @atendentes = []
     if @chamado.grupo.usuarios.include? @current_usuario
        @chamado.grupo.usuarios.each do |u|
           @atendentes << [u.name, u.id]   unless @atendentes.include? u
        end
     end
  end

  def meus_chamados
    @chamados = Chamado.paginate(:conditions => ["usuario_id = ?", @current_usuario.id], :order => 'updated_at desc', :page => params[:page] )
  end
    
  def index
    @chamados = Chamado.paginate(:order => 'id desc', :page => params[:page] )
  end

  def show
    @chamado = Chamado.find(params[:id])
  end

  def new
    @chamado = Chamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chamado }
    end
  end

  def create
     @chamado = Chamado.new(params[:chamado])
     @chamado.usuario  = @current_usuario
     
     salvo = @chamado.save 
      
     if salvo and !params[:arquivo].blank?
        arquivo         = Arquivo.new
        arquivo.arquivo = params[:arquivo]
        arquivo.chamado = @chamado
        arquivo.save
     end
     
     @mensagem.chamado   = @chamado 
     @mensagem.descricao = params[:mensagem]
     @mensagem.save
     
     respond_to do |format|
        if salvo
           format.html { redirect_to(:action => :meus_chamados) }
           format.xml  { render :xml => @chamado, :status => :created, :location => @chamado }
        else
           format.html { render :action => "new" }
           format.xml  { render :xml => @chamado.errors, :status => :unprocessable_entity }
        end
     end
  end

  def update
    @chamado = Chamado.find(params[:id])

    respond_to do |format|
      if @chamado.update_attributes(params[:chamado])
        flash[:notice] = 'Chamados was successfully updated.'
        format.html { redirect_to(:action => :index) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chamado.errors, :status => :unprocessable_entity }
      end
    end
  end

=begin
  def destroy
    @chamado = Chamado.find(params[:id])
    @chamado.destroy

    respond_to do |format|
      format.html { redirect_to(chamado_url) }
      format.xml  { head :ok }
    end
  end
=end
  def monta_select
     @sistemas  = []
     @sistemas << ['Selecione', 0]
     @current_usuario.grupos.all(:conditions => 'atendente is not true').each do |g|
        g.sistemas.each do |s|
           @sistemas << [s.nome, s.id] 
        end
     end
  end
  private:monta_select
end
