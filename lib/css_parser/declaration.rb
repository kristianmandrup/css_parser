module CssParser
  class Declaration
    attr_accessor :property, :value, :important
    
    def initialize(property, value, important)
      @property = property
      @value = value
      @important = important            
    end
    
    def to_s(importance = nil)
      "#{property}: #{value}#{ ' !important' if important || importance}; \n"
    end
      
  end
end