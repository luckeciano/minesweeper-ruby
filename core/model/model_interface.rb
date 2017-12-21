#Model Interface that is implemented for
#every model. It's useful when there
#are multiples kinds of models
#
#Author:: Luckeciano(luckeciano@gmail.com)

require_relative '../utils/abstract_interface.rb'
class ModelInterface
    include AbstractInterface
    
    needs_implementation :get_state
end