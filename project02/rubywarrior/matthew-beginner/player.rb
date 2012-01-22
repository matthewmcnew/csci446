class Player
  def health_calculator(warrior)
    if @healh != 10
     @health = 10
    end
  end
  def play_turn(warrior)
     health_calculator(warrior)
     if warrior.feel.empty?
      if warrior.health != 20
        warrior.rest!
      else
        warrior.walk!
      end
     else
        warrior.attack!
     end
  end
end
