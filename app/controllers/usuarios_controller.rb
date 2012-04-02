class UsuariosController < AdminController
   before_filter :is_admin? , :except => [:edit, :update]
      
   def index
      @usuarios = Usuario.paginate(:order => 'login', :page => params[:page] )
   end
   
   def reset
      usuario = Usuario.find(params[:id])
      usuario.password = usuario.password_confirmation = '123456'
      usuario.save
      redirect_to :action => :index
   end
   
   def bloquear
      usuario = Usuario.find(params[:id]) 
      usuario.bloqueado = (usuario.bloqueado == false)
      usuario.save
      redirect_to :action => :index
   end
   
   def new
      @usuario = Usuario.new
      @usuario.password = @usuario.password_confirmation = nil
   end
   
   def edit
      login_required
      if @current_usuario.grupos.include? Grupo.first
         id = params[:id]
      else
         id = @current_usuario.id
      end
      
      @usuario = Usuario.find(id)
   end
   
   def update
     login_required
     if @current_usuario.grupos.include? Grupo.first
         id = params[:id]
      else
         id = @current_usuario.id
      end
      @usuario = Usuario.find(id)
      
      respond_to do |format|
         if @usuario.update_attributes(params[:usuario])
            format.html { redirect_to(:action => :index) }
            format.xml  { head :ok }
         else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
         end
      end
   end
   
   def create
      #logout_keeping_session!
      @usuario = Usuario.new(params[:usuario])
      success = @usuario && @usuario.save
      if success && @usuario.errors.empty?
         # Protects against session fixation attacks, causes request forgery
         # protection if visitor resubmits an earlier form using back button. Uncomment if you understand the tradeoffs.
         # reset session
         # self.current_usuario = @usuario # !! now logged in
         # redirect_back_or_default('/')
         # flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
         redirect_to :action => :index
      else
         #flash[:error]  = "Não foi possível criar a conta, tente novamente ou entre em contato com o Administrador."
         render :action => :new
      end
   end
   
end
