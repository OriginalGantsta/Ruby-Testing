require_relative 'save_game'
require_relative 'episodes/@series'
require_relative 'requirements/@requirements'
require_relative 'episode_returns/episode_return_handler'






def storyEngine(episode= episode_randomizer($main_storyline.series), series = $main_storyline.series)
    include Episode_return_handler
    episode_return = series[episode].play
    handle_returns(episode_return)
    play(episode_return)
end

def episode_randomizer(series)
    loop do
        episode_key = series.keys[rand(series.length)]
        return episode_key if series[episode_key].valid          
    end
end

storyEngine()
