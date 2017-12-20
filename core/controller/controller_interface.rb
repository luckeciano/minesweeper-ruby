require_relative '../utils/abstract_interface.rb'
class ModelInterface
    include AbstractInterface
    
    needs_implementation :play, :victory
end