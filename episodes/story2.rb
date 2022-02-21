$series[2] = lambda do 
    loop do 
        puts "Type \"q\" to save and quit"
        userInput = gets.chomp
        if (userInput == "q")
            return "q"
        else
            puts "You are an idiot"
        end
    end
end


#episode_name: string script:string response:{listener : return}



generate_episode(3, "Type 7", {"7"=>{:continue_episode => 4}})
generate_episode(4, "Type 8", {"8"=>{:continue_episode => 1}})