require_relative "../player_info/@player.rb"

$requirement_test_definitions = {}

class Auditor
   attr_accessor :requirements
   def initialize(requirements)
      @requirements = requirements
   end

   def test
      @requirements.each do |key, value| 
         return false if !$requirement_test_definitions[key].judgement(value)
      end
      return true
   end
end

class Requirement
   attr_accessor :name, :judge, :criteria
   def initialize(name, judge)
      @requirement_name = name
      @judge = judge
      $requirement_test_definitions[@requirement_name] = self
   end
   
   def judgement(criteria)
      @judge.call(criteria)
   end
end

Dir[File.join(__dir__, '*.rb')].each {|file| require file}