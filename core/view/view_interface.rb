require_relative '../utils/abstract_interface.rb'
class ViewInterface
    include AbstractInterface
    
    needs_implementation :print_model_state
end