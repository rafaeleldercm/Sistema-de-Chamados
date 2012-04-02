class TipoChamadosController < AdminController

   def index
      @tipo_chamados = TipoChamado.paginate(:order => 'nome', :page => params[:page] )
  
      respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @tipo_chamados }
      end
   end
 
   def show
      @tipo_chamado = TipoChamado.find(params[:id])
  
      respond_to do |format|
         format.html # show.html.erb
         format.xml  { render :xml => @tipo_chamado }
      end
   end
 
   def new
      @tipo_chamado = TipoChamado.new
  
      respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @tipo_chamado }
      end
   end
 
   def edit
      @tipo_chamado = TipoChamado.find(params[:id])
   end
 
   def create
       @tipo_chamado = TipoChamado.new(params[:tipo_chamado])
       
       respond_to do |format|
          if @tipo_chamado.save
             flash[:notice] = 'TipoChamado was successfully created.'
             format.html { redirect_to tipo_chamados_path }
             format.xml  { render :xml => @tipo_chamado, :status => :created, :location => @tipo_chamado }
          else
             format.html { render :action => "new" }
             format.xml  { render :xml => @tipo_chamado.errors, :status => :unprocessable_entity }
          end
       end
    end
 
   def update
       @tipo_chamado = TipoChamado.find(params[:id])
       
       respond_to do |format|
         if @tipo_chamado.update_attributes(params[:tipo_chamado])
            flash[:notice] = 'TipoChamado was successfully updated.'
            format.html { redirect_to tipo_chamados_path }
            format.xml  { head :ok }
         else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @tipo_chamado.errors, :status => :unprocessable_entity }
         end
      end
   end
   
   def destroy
      @tipo_chamado = TipoChamado.find(params[:id])
      @tipo_chamado.destroy
  
      respond_to do |format|
         format.html { redirect_to(tipo_chamados_url) }
         format.xml  { head :ok }
      end
   end
end
