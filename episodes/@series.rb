require_relative "../requirements/@requirements"

$series = {}

class Episode 

attr_accessor :episode_name, :script, :responses

    def initialize(episode_name, script, responses, requirements)
        @script = script
        @responses = responses
        @audit = Auditor.new(requirements)
        $series[episode_name] = self
    end

    def play
        loop do
            puts @script
            userInput = gets.chomp
            if (userInput == "q")
                return "q"
            else 
                @responses.each do |listener, response|
                    if userInput == listener
                        return response
                    end
                end
            end
        end
    end   
    
    def valid
        @audit.test
    end   
end

Dir[File.join(__dir__, '*.rb')].each do |file| 
    if !file.include? "@series" 
        require file 
    end
end
