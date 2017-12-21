#View Interface that is implemented for
#every model. It's useful when there
#are multiples kinds of views
#
#Author:: Luckeciano(luckeciano@gmail.com)

require_relative '../utils/abstract_interface.rb'
class ViewInterface
    include AbstractInterface
    
    needs_implementation :print_model_state
end