module Episode_return_handler
    attr_accessor :returns
    def handle_returns(episode_return)
        if episode_return != "q"
            episode_return.each do |key, value| 
                $episode_returns.episode_return_definitions[key].handle(value) if key != :continue_episode && key != :continue_series
            end
        end
    end

    def play(episode_return)
        if episode_return == "q"
            saveGame
            puts "Closing game..."
            return
        else
            if episode_return[:continue_series] != nil 
                episode_return[:continue_episode] != nil ? storyEngine(episode_return[:continue_episode, :continue_series]) : storyEngine(episode_return[:continue_series])
            else
                episode_return[:continue_episode] != nil ? storyEngine(episode_return[:continue_episode]) : storyEngine()
            end
        end
    end
end

class Episode_returns
    attr_accessor :name, :handler
    attr_reader :episode_return_definitions
    def initialize
     @episode_return_definitions = {}   
    end
    def generate_return(name, handler)
        @episode_return_definitions[name] = Episode_return.new(handler)
    end
end

class Episode_return
    attr_accessor :handler, :criteria
    def initialize(handler)
        @handler = handler
    end

    def handle(criteria)
        @handler.call(criteria)
    end
end

$episode_returns = Episode_returns.new

Dir[File.join(__dir__, '*.rb')].each do |file| 
    if !file.include? "episode_return_handler.rb" 
        require file 
    end
end



