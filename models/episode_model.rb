require_relative "../story_show"



def generate_episode(name, requirements, script)
    storyscript[name]=  {script: script, requirements: requirements}
end