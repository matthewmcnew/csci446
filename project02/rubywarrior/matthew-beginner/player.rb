class Player
  def play_turn(warrior)
     
     if warrior.feel.empty?
      if warrior.health != 20 and warrior.health > @health
        @health = warrior.health
        warrior.rest!
      else
        warrior.walk!
        @health = 0
      end
     else
        warrior.attack!
     end
  end
end
