module CssParser
  module DeclarationAPI
    def each_declaration # :yields: property, value, is_important      
      @declarations.each do |d|
        yield d
      end
    end      

    # def each_declaration # :yields: property, value, is_important      
    #   decs = @declarations.sort { |a,b| a[1][:order].nil? || b[1][:order].nil? ? 0 : a[1][:order] <=> b[1][:order] }
    #   decs.each do |property, data|
    #     if !data
    #       puts "bad data! prop: #{property}, data: #{data}"
    #       next 
    #     end
    #     value = data[:value]
    #     yield Declaration.new property.downcase.strip, value.strip, data[:is_important]
    #   end
    # end

    # Return all declarations as a string.
    #--
    # TODO: Clean-up regexp doesn't seem to work
    #++
    def declarations_to_s(options = {})
     options = {:force_important => false}.merge(options)
     str = ''
     importance = options[:force_important] # ? ' !important' : ''
     self.each_declaration { |decl| str += "#{decl.to_s(importance)}" }
     str.gsub(/^[\s]+|[\n\r\f\t]*|[\s]+$/mx, '').strip
    end


    # Add a CSS declaration to the current RuleSet.
    #
    #  rule_set.add_declaration!('color', 'blue')
    #
    #  puts rule_set['color']
    #  => 'blue;'
    #
    #  rule_set.add_declaration!('margin', '0px auto !important')
    #
    #  puts rule_set['margin']
    #  => '0px auto !important;'
    #
    # If the property already exists its value will be over-written.
    def add_declaration!(property, value) 
      puts "add_declaration! #{property} #{value}"
       
      if value.nil? or value.empty?
        @declarations.delete(property)
        return
      end
    
      value.gsub!(/;\Z/, '')
      is_important = !value.gsub!(CssParser::IMPORTANT_IN_PROPERTY_RX, '').nil?
      property = property.downcase.strip
      
      puts "property: #{property} value: #{value} #{@order}"
      @declarations[property] = {
        :value => value.strip, :is_important => is_important, :order => @order += 1
      } 
      puts "added : #{@declarations}"
    end
    alias_method :[]=, :add_declaration!

    def parse_declarations!(block) # :nodoc: 
      @declarations = {}  

      return unless block

      block.gsub!(/(^[\s]*)|([\s]*$)/, '')

      decs = block.split(/[\;$]+/m)

      decs.each do |decs|
        if matches = decs.match(/(.[^:]*)\:(.[^;]*)(;|\Z)/i)              
          property, value, end_of_declaration = matches.captures


          puts "parse - property: #{property} , value: #{value}"
          add_declaration!(property, value)          
        end
      end
      
    end  
  end
end