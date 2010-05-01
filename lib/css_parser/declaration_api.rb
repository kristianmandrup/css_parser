module CssParser
  module DeclarationAPI
    def each_declaration # :yields: property, value, is_important      
      decs = @declarations.sort { |a,b| a[1][:order].nil? || b[1][:order].nil? ? 0 : a[1][:order] <=> b[1][:order] }
      decs.each do |property, data|
        next if !data
        value = data[:value]
        yield Declaration.new property.downcase.strip, value.strip, data[:is_important]
      end
    end

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
      if value.nil? or value.empty?
        @declarations.delete(property)
        return
      end
    
      value.gsub!(/;\Z/, '')
      is_important = !value.gsub!(CssParser::IMPORTANT_IN_PROPERTY_RX, '').nil?
      property = property.downcase.strip
      @declarations[property] = {
        :value => value, :is_important => is_important, :order => @order += 1
      }
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
          
          add_declaration!(property, value)          
        end
      end
    end  
  end
end