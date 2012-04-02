# Methods added to this helper will be available to all templates in the application.

#require "lib/mondrian_util.rb"
module ApplicationHelper
#  include MondrianUtil


   def will_paginate_custom(obj)
      will_paginate obj, :prev_label => image_tag('left.png', :title=>'Página Anterior', :align=>'absmiddle'), :next_label => image_tag('right.png', :title=>'Próxima Página', :align=>'absmiddle')
   end
end
