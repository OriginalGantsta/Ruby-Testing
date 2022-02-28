require_relative 'save_game'
require_relative 'episodes/@series'
require_relative "requirements/@requirements.rb"






def storyEngine(episode= episode_randomizer, series = $series)
    story_return = series[episode].play
    if story_return == "q"
        saveGame
        puts "Closing game..."
        return
    else
        story_return[:continue_episode] != nil ? storyEngine(story_return[:continue_episode]) : storyEngine
    end
end

def episode_randomizer
    loop do
        episode_key = $series.keys[rand($series.length)]
        return episode_key if $series[episode_key].valid          
    end
end

storyEngine(2)
