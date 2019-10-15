require 'pry'
class Player
  attr_accessor :name, :life_points

  #--            Create players              --
  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  #--               state             --
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  #--               damage            --
  def gets_damage(damage)
    @life_points -= damage    # gives some damages
    if @life_points <= 0      # check if life points are at 0
      puts "#{@name} a été tué !"   # if life point is 0 I give the information to the player
    end
  end

  #--              attaque            --
  def attacks(player)
    puts "#{@name} attaque #{player.name} !"   # player start to attack
    damage = compute_damage
    puts "Il lui inflige #{damage} points de degats." # calculate the damages and show the results
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player    
  attr_accessor :weapon_level

  def initialize(player_name)
    @weapon_level = 1

    super
    @life_points = 100

  end

  #--             state              --
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  #   --         compute damage          --
  def compute_damage
    rand(1..6) * @weapon_level
  end

  #   --         search weapon        --
  def search_weapon
    weapon_level = rand(1..6) 
    puts "Tu as trouvé une arme de niveau #{weapon_level}"
    if weapon_level > @weapon_level
      @weapon_level = weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  #   --      search health       --
  def search_health_pack
    pv = rand(1..6)
    if pv == 1
      puts "Tu n'as rien trouvé... "
    end
    if (pv > 1) && (pv < 6)
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
      if @life_points>=100
        @life_points = 100
        puts "Vous êtes au maximum de votre vie"
      end
    end
    if pv == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      if @life_points>100
        @life_points = 100
        puts "Vous êtes au maximum de votre vie"
      end
    end
  end

end
