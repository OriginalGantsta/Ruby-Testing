require_relative "../player_info/@player.rb"



class Auditor
   attr_accessor :requirements
   def initialize(requirements)
      @requirements = requirements
   end

   def test
      @requirements.each do |key, value| 
         return false if !$requirements.requirement_test_definitions[key].judgement(value)
      end
      return true
   end
end

class Requirements
   attr_accessor :name, :judge
   attr_reader :requirement_test_definitions
   def initialize
      @requirement_test_definitions = {}
   end

   def define_requirement(name, judge)
      @requirement_test_definitions[name]= Requirement.new(judge)
   end
end

class Requirement
   attr_accessor :judge, :criteria
   def initialize(judge)
      @judge = judge
   end
   
   def judgement(criteria)
      @judge.call(criteria)
   end
end

$requirements = Requirements.new

Dir[File.join(__dir__, '*.rb')].each {|file| require file}