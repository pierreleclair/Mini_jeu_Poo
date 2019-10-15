class Game
    attr_accessor :humanplayer, :ennemies
   
    def initialize (humanplayer)
      @humanplayer = HumanPlayer.new("#{humanplayer}")
      @player_1 = Player.new("Josiane")
      @player_2 = Player.new("José")
      @player_3 = Player.new("Riana")
      @player_4 = Player.new("Jean")
      @players_left = 10
      @enemies_in_sight = []
      @ennemies = [@player_1, @player_2, @player_3, @player_4]
    end
    def kill_player
      @ennemies.each {
       |player|
      if (player.life_points <= 0)
        @ennemies.delete(player)
        puts "#{player.name} est mort HAHAHAHAHHAHAH IZI "
      end
      }
    end
    def is_still_ongoing?
      if @humanplayer.life_points > 0 && (@player_1.life_points > 0 || @player_2.life_points > 0 || @player_3.life_points > 0 || @player_4.life_points > 0)
        return true
      else
        return false
      end
    end
  
    def show_players
      puts
      @humanplayer.show_state
      puts "******************************************************************************"
      puts "                           #{@ennemies.size} ENNEMIS VEULENT TE TUER"
      puts "******************************************************************************"
      puts
    end
   # Seléction menu
    def menu
      command = 1
      puts "-------------------------TU VAS FAIRE QUOI LA, HEIN ?-------------------------- "
      puts
      puts
      puts "a - Si ton arme est pas de LVL 4 au moins vas en chercher une autre NOOB"
      puts
      puts
      puts "MEDOC - Vas te soigner idiot si tu n'as pas plus de 5Opv et dis MEDOC"
      puts
      puts
      puts "Fais pas la tapette si tu as plus de 50PV et pas une arme de merde ATTAQUE :"
      puts
      @ennemies.each {
      |player| puts "#{command} - #{player.name} a #{player.life_points} vie"
      command += 1
       }
    end
   # Choix
    def menu_choice(action)
      if action == "a"
        @humanplayer.search_weapon
          elsif action == "MEDOC"
        @humanplayer.search_health_pack
          elsif action == "1"
        @humanplayer.attacks(@player_1)
          elsif action == "2"
        @humanplayer.attacks(@player_2)
          elsif action == "3"
        @humanplayer.attacks(@player_3)
          elsif action == "4"
        @humanplayer.attacks(@player_4)
          else puts "Sélectionner une option a, s, 1, 2, 3 or 4"
      end
        kill_player
    end
    def enemies_attack
      puts "-------------Les autres joueurs attaquent !------------"
        @ennemies.each {
        |player| player.attacks(@humanplayer)
          }
     def end
            puts "Le jeu est fini !"
            ennemies{|ennemi| ennemi.life_points <= 0} ? (puts "Bravo ! Tu as gagné !") : (puts "Loser ! Tu as perdu !")
          end
    end
   # Game over screen
   end