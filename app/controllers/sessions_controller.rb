# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
   # Be sure to include AuthenticationSystem in Application Controller instead
   include AuthenticatedSystem
   before_filter :login_required, :only => [:destroy, :index]
   layout 'login' 

   def index
      render :layout => 'default'
   end
 
   def create
     logout_keeping_session!
     usuario = Usuario.authenticate(params[:login], params[:password])
     
     if usuario && usuario.pode_logar?
        # Protects against session fixation attacks, causes request forgery
        # protection if user resubmits an earlier form using back
        # button. Uncomment if you understand the tradeoffs.
        # reset_session
        self.current_usuario = usuario
        new_cookie_flag = (params[:remember_me] == "1")
        handle_remember_cookie! new_cookie_flag
        flash[:notice] = "Login realizado com sucesso"
        redirect_back_or_default('/')
        return
     elsif usuario
        flash[:error] = "Usuario: '#{params[:login]}' esta bloqueado."
     else
        note_failed_signin
        @login       = params[:login]
        #@remember_me = params[:remember_me]
     end
     render :action => 'new'
     return
  end

  def destroy
     logout_killing_session!
     flash[:notice] = "Voce saiu do sistema."
     redirect_back_or_default('/')
  end

   # Track failed login attempts
   def note_failed_signin
      flash[:error] = "Nao foi possivel entrar como '#{params[:login]}'"
      logger.warn "Falha no login para '#{params[:login]}' por #{request.remote_ip} em #{Time.now.utc}"
   end
   protected:note_failed_signin
end
