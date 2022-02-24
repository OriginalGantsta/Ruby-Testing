require_relative 'save_game'
require_relative 'episodes/@series'
require_relative "requirements/@requirements.rb"






def storyEngine(i)
    story_return = $series[i.to_i][:storyline].call
    
    if story_return == "q"
        saveGame
        puts "Closing game..."
        return
    end

    if story_return[:continue_episode] != nil
       storyEngine(story_return[:continue_episode])
    else 
        storyEngine(story_randomizer)
    end
end

define_method (:episode_randomizer){
    loop do
        episode_key = $series.keys[rand($series.length)]
        puts episode_key if requirement_tester($series[episode_key][:requirements])      
    end
}xz

storyEngine(3)