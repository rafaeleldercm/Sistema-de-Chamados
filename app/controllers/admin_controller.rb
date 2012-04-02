class AdminController < ActionController::Base
   helper :all # include all helpers, all the time
   layout "default"
   include AuthenticatedSystem

   #before_filter :valida_acesso_admin
   before_filter :is_admin?
  
   #def valida_acesso_admin
   #   login_required
   #end

   def is_admin?
      login_required
      unless @current_usuario.grupos.include? Grupo.first
         redirect_to '/'
         return
      end
   end



end
