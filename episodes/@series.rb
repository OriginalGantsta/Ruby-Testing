require_relative "../requirements/@requirements"


class Series
    attr_accessor :episode_name, :script, :responses, :requirements
    attr_reader :series
    
    def initialize
        @series = {}
    end

    def write_episode (episode_name, script, responses, requirements)
        @series[episode_name] = Episode.new(script, responses, requirements)
    end

end

class Episode 
attr_accessor :script, :responses, :requirements

    def initialize(script, responses, requirements)
        @script = script
        @responses = responses
        @audit = Auditor.new(requirements)
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

