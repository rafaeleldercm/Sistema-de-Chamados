class Arquivo < ActiveRecord::Base
   belongs_to :chamado

   has_attached_file :arquivo, :path => ":rails_root/public/upload/:id.:extension",
                               :url => "/upload/:id.:extension"
end
