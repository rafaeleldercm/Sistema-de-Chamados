require 'digest/sha1'

class Usuario < ActiveRecord::Base
   include Authentication
   include Authentication::ByPassword
   include Authentication::ByCookieToken
   
   has_and_belongs_to_many :grupos

   has_many :usuarios
 
   validates_presence_of     :login, :email, :telefone, :name
   validates_length_of       :login,    :within => 3..40
   validates_uniqueness_of   :login
   validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message
 
   validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
   validates_length_of       :name,     :maximum => 100
 
   validates_length_of       :email,    :within => 6..100 #r@a.wk
   validates_uniqueness_of   :email
   validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
 
   
   # HACK HACK HACK -- how to do attr_accessible from here?
   # prevents a user from submitting a crafted form that bypasses activation
   # anything else you want your user to change should be added here.
   attr_accessible :login, :email, :telefone, :name, :password, :password_confirmation
 
   def self.authenticate(login, password)
      return nil if login.blank? || password.blank?
      u = find_by_login(login.downcase) # need to get the salt
      u && u.authenticated?(password) ? u : nil
   end
 
   def login=(value)
      write_attribute :login, (value ? value.downcase : nil)
   end
 
   def email=(value)
      write_attribute :email, (value ? value.downcase : nil)
   end
   
   def pode_logar?
      return !self.bloqueado
   end
   
   def is_atendente? (sistema_id)
      self.grupos.each do |g|
         if sistema_id == 'any'
            if g.atendente 
               return true
            end
         else
            if g.atendente and g.sistemas.include? Sistema.find(sistema_id)
               return true
            end
         end
      end
      return false
   end

   def is_admin?
      self.grupos.include? Grupo.first
   end

   def sistemas_atendimento
      retorno = []
      self.grupos.each do |g|
         g.sistemas.each do |s|
            retorno << s unless retorno.include? s
         end
      end
      return retorno
   end
end
