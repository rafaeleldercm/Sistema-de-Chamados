class GruposController < AdminController
 
   def index
      @grupos = Grupo.paginate(:order => 'nome', :page => params[:page] )
      respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @grupos }
      end
   end
 
   def usuarios
      @grupo = Grupo.find(params[:id])
      @usuarios = Usuario.all(:order => 'name')
   end

   def sistemas
      @grupo = Grupo.find(params[:id])
      @sistemas = Sistema.all(:order => 'nome')
   end

   def update_sistema
      @grupo = Grupo.find(params[:id])

      if params[:tipo].blank?
         @grupo.sistemas.delete_all
      else
         vet_ids = []
         params[:tipo].each do |t|
            vet_ids << t.to_i
         end

         @grupo.sistemas.each do |s|
            unless vet_ids.include? s.id
               @grupo.sistemas.delete(s)
               vet_ids.delete(s.id)
            end
         end

         vet_ids.each do |id|
            sistema = Sistema.find(id)
            @grupo.sistemas << sistema unless @grupo.sistemas.include? sistema
         end
      end

      redirect_to :action => :index
   end

   def update_usuario
      @grupo = Grupo.find(params[:id])

      if params[:tipo].blank? 
         @grupo.usuarios.delete_all
      else
         vet_ids = []
         params[:tipo].each do |t|
            vet_ids << t.to_i
         end


         @grupo.usuarios.each do |u|
            unless vet_ids.include? u.id
               @grupo.usuarios.delete(u)
               vet_ids.delete(u.id)
            end
         end

         vet_ids.each do |id|
            usuario = Usuario.find(id)
            @grupo.usuarios << usuario unless @grupo.usuarios.include? usuario
         end
      end

      redirect_to :action => :index
   end

 
   def show
      @grupo = Grupo.find(params[:id])
      respond_to do |format|
         format.html # show.html.erb
         format.xml  { render :xml => @grupo }
      end
   end
 
   def new
      @grupo = Grupo.new
  
      respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @grupo }
      end
   end
    
   def edit
      @grupo = Grupo.find(params[:id])
   end
 
   def create
      @grupo = Grupo.new(params[:grupo])
  
      respond_to do |format|
         if @grupo.save
            flash[:notice] = 'Grupo Cadastrado com sucesso.'
            format.html { redirect_to :action => :index }
            format.xml  { render :xml => @grupo, :status => :created, :location => @grupo }
         else
            format.html { render :action => "new" }
            format.xml  { render :xml => @grupo.errors, :status => :unprocessable_entity }
         end
      end
   end
 
   def update
      @grupo = Grupo.find(params[:id])
  
      respond_to do |format|
         if @grupo.update_attributes(params[:grupo])
           flash[:notice] = 'Grupo Atualizado Com Sucesso.'
           format.html { redirect_to :action => :index }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @grupo.errors, :status => :unprocessable_entity }
         end
      end
   end
 
   def destroy
      @grupo = Grupo.find(params[:id])
      @grupo.destroy
  
      respond_to do |format|
         format.html { redirect_to(grupos_url) }
         format.xml  { head :ok }
      end
   end
end
