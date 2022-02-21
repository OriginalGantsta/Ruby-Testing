require_relative "../player_info/@player.rb"
@requirement_test_definitions = {}
Dir[File.join(__dir__, '*.rb')].each {|file| require file}

#requirement_tester takes a hash that has the requirements as keys and things to be checked as values 

define_method(:requirement_tester){|requirements|
    requirements.each do |key, value| 
       return false if !@requirement_test_definitions[key].call(value)
    end
    return true}

    


