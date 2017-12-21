require_relative '../utils/abstract_interface.rb'
class ControllerInterface
    include AbstractInterface
    
    needs_implementation :play, :is_victory
end