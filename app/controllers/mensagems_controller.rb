class MensagemsController < ApplicationController
   before_filter :login_required
   
   def new
      @mensagem                 = Mensagem.new
      @mensagem.attr_chamado_id = params[:id]
      @chamado_status           = @mensagem.select_status(@current_usuario.id)

      respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @mensagem }
      end
   end
   
   def create
      @mensagem = Mensagem.new(params[:mensagem])
      @mensagem.usuario = @current_usuario
      
      respond_to do |format|
         if @mensagem.save
            format.html { redirect_to(:controller => :chamados, :action => :show, :id => @mensagem.chamado_id) }
            format.xml  { render :xml => @mensagem, :status => :created, :location => @mensagem }
         else
            format.html { render :action => "new" }
            format.xml  { render :xml => @mensagem.errors, :status => :unprocessable_entity }
         end
      end
   end
   
=begin
   def index
      @mensagems = Mensagem.all
      respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @mensagems }
      end
   end
   
   def show
      @mensagem = Mensagem.find(params[:id])
      respond_to do |format|
         format.html # show.html.erb
         format.xml  { render :xml => @mensagem }
      end
   end

   def edit
      @mensagem = Mensagem.find(params[:id])
   end
   
   def update
      @mensagem = Mensagem.find(params[:id])
      respond_to do |format|
         if @mensagem.update_attributes(params[:mensagem])
            flash[:notice] = 'Mensagem was successfully updated.'
            format.html { redirect_to(@mensagem) }
            format.xml  { head :ok }
         else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @mensagem.errors, :status => :unprocessable_entity }
         end
      end
   end
 
   def destroy
      @mensagem = Mensagem.find(params[:id])
      @mensagem.destroy
      respond_to do |format|
         format.html { redirect_to(mensagems_url) }
         format.xml  { head :ok }
      end
   end
=end

end 
