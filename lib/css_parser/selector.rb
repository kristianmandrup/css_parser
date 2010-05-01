require 'css_parser/declaration_api'

module CssParser
  class Selector
    include CssParser::DeclarationAPI

    attr_accessor :selector, :declarations, :specificity
    
    def initialize(selector, declarations, specificity)
      @selector = selector
      @order = 0                 
      @declarations = parse_declarations!(declarations)
      @specificity = specificity 
    end

    def declarations_to_s(options = {})
      declarations.map{|decl| decl + ';'}.join('')
    end

    
    def to_s
      "#{selector}\n{\n#{declarations}\n} \n"
    end

  end
end
