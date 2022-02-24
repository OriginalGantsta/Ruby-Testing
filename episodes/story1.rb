

$series[1]= 
{
:requirements => {:completed_episodes => [1,2,3]},
:storyline => -> {
    def puzzle() 
        puts "Type \"2\""
        userInput = gets.chomp
        if (userInput == "q")
            return "q"
        elsif (userInput == "2")
            return {:continue_episode => 2}
        else
            puts "You are an idiot"
             puzzle()
        end
    end
    puzzle() 
}}