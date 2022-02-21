require_relative 'save_game'
require_relative 'episodes/@series'






def storyEngine(i)
    story_return = $series[i.to_i].call
    
    if story_return == "q"
        saveGame
        puts "Closing game..."
        return
    end

    if story_return[:continue_episode] != nil
       storyEngine(story_return[:continue_episode])
    else 
        puts "running random story"
    end
end

storyEngine(3)