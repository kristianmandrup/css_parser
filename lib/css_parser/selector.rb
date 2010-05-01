module CssParser
  class Selector
    attr_accessor :selector, :declarations, :specificity
    
    def initialize(selector, declarations, specificity)
      @selector = selector
      @declarations = declarations
      @specificity = specificity            
    end
    
    def to_s
      "#{selector} \n/* specificity: #{specificity} */\n {\n#{declarations}\n} \n"
    end
      
  end
end
