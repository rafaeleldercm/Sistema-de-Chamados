class ArquivosController < ApplicationController
   before_filter :login_required
   
   def new
      @arquivo = Arquivo.new
      @arquivo.chamado_id = params[:id]
   end

   def create
      @arquivo = Arquivo.new(params[:arquivo])
 
      respond_to do |format|
         if @arquivo.save
            format.html { redirect_to(:controller => :chamados, :action => :show, :id => @arquivo.chamado_id) }
         else
            format.html { render :action => "new" }
            format.xml  { render :xml => @arquivo.errors, :status => :unprocessable_entity }
         end
      end
   end
end
