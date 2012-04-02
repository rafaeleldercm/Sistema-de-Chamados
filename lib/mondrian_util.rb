# To change this template, choose Tools | Templates
# and open the template in the editor.

class Time
  def self.today
    Date.today
  end
end

module MondrianUtil
    def text_to_date(v)
        if v.grep(/-/).size > 0 then
          v.to_date
        else 
        	dia, mes, ano = v.gsub(/[a-z,A-Z]/,'').gsub(/-/,'/').split("/")
    	      [ano,mes,dia].join("-").to_date
        end
    end
   def f_moeda(v)
      v.to_f.round(2).reais.to_s
   end
end

   class Float
         def roundTo(x)
            (self * 10**x).round.to_f / 10**x
         end
         def ceilCo(x)
            (self * 10**x).ceil.to_f / 10**x
         end
         def floorTo(x)
            (self * 10**x).floor.to_f / 10**x
         end
      end
