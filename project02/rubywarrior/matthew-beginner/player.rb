class Player
  
  def initialize
    @direction = :forward
    @should_be_recharging = false
  end
  
  def play_turn(warrior)
     
     if warrior.feel(:forward).wall? 
      warrior.pivot!(:backward)
      return
     end
     
     
     if @should_be_recharging
      if warrior.health == 20
        @should_be_recharging = false
      elsif warrior.feel(:backward).wall? 
        warrior.rest!
        return
      elsif 
        warrior.walk!(:backward)
        return
      end
     end
     
     if warrior.health < 10 # and warrior.health > @health
         # @health = warrior.health
         @should_be_recharging = true
         warrior.walk!(:backward)
     else
       if warrior.feel(@direction).captive?
         warrior.rescue!(@direction)
         @direction = :forward
       elsif warrior.feel(@direction).enemy?
         warrior.attack!
         @wall = false
         
         # @health = 0
       else
        warrior.walk!(@direction) 
       end
     end 



  end
end
