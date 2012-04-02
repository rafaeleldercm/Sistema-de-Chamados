class SistemasController < AdminController

   def index
      @sistemas = Sistema.paginate(:order => 'nome', :page => params[:page] )
      respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @sistemas }
      end
   end
 
   def show
      @sistema = Sistema.find(params[:id])
      respond_to do |format|
         format.html # show.html.erb
         format.xml  { render :xml => @sistema }
      end
   end
 
   def new
      @sistema = Sistema.new
      respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @sistema }
      end
   end
 
   def edit
      @sistema = Sistema.find(params[:id])
   end
   
   def create
      @sistema = Sistema.new(params[:sistema])
      
      respond_to do |format|
         if @sistema.save
            flash[:notice] = 'Sistema was successfully created.'
            format.html { redirect_to(sistemas_path) }
            format.xml  { render :xml => @sistema, :status => :created, :location => @sistema }
         else
            format.html { render :action => "new" }
            format.xml  { render :xml => @sistema.errors, :status => :unprocessable_entity }
         end
      end
   end
   
   def update
     @sistema = Sistema.find(params[:id])
     
     respond_to do |format|
       if @sistema.update_attributes(params[:sistema])
         flash[:notice] = 'Sistema was successfully updated.'
         format.html { redirect_to(sistemas_path) }
         format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @sistema.errors, :status => :unprocessable_entity }
       end
     end
   end
 
   def destroy
     @sistema = Sistema.find(params[:id])
     @sistema.destroy
     
     respond_to do |format|
       format.html { redirect_to(sistema_url) }
       format.xml  { head :ok }
     end
   end
   
   def tipo_de_chamado
      @sistema = Sistema.find(params[:id])
      @tipo_chamado = TipoChamado.all(:order => 'nome')
   end
 
   def update_tipo_de_chamado
      @sistema = Sistema.find(params[:id])

      if params[:tipo].blank?
         @sistema.usuarios.delete_all
      else
         vet_ids = []
         params[:tipo].each do |t|
            vet_ids << t.to_i
         end

         @sistema.tipo_chamados.each do |u|
            unless vet_ids.include? u.id
               @sistema.tipo_chamados.delete(u)
               vet_ids.delete(u.id)
            end
         end

         vet_ids.each do |id|
            tipo = TipoChamado.find(id)
            @sistema.tipo_chamados << tipo unless @sistema.tipo_chamados.include? tipo
         end
      end
      
      redirect_to :action => :index
   end
end
