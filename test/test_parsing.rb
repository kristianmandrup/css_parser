require 'css_parser'

@order = 0

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

css = %q{
  color: green;
  font-weight: bold;
}                              

puts parse_declarations!(css).inspect

puts @declarations.inspect