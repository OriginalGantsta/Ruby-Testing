$series = {}

define_method (:generate_episode){|episode_name, script, responses|
    $series[episode_name] = lambda do
        loop do
            puts script
            userInput = gets.chomp
            if (userInput == "q")
                return "q"
            else 
                responses.each do |listener, response|
                    if userInput == listener
                        return response
                    end
                end
            end
        end
    end
}

Dir[File.join(__dir__, '*.rb')].each {|file| require file}