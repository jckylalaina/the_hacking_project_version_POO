require_relative 'controller'

class Router
  def initialize
    @controller =  Controller.new
  end

  def perform
    puts "BIENVENUE DANS THE GOSSIP PROJECT"
    while true
      puts "Tu veux faire quoi BG ?"
      puts "1. Je veux créer un gossip"
      puts "2.je veux voir les potin"
      puts "3.veux-tu supprimer un"
      puts "4. Je veux quitter l'app"
      params = gets.chomp.to_i
      case params
      when 1
        puts "Tu as choisi de créer un gossip" 
        @controller.create_gossip
      when 2
        puts "voilà tes potin"
        @controller.index_gossip 
      when 3
        puts "tu vas supprimé un potin"
        @controller.destroy  
      when 4
        system("clear")
        puts "###########"
        puts "À bientôt !"
        puts "-----------"
        break
      else
        system("clear")
        puts "W-R-O-N-G"
        puts "Erreur, merci de ressayer"
      end
    end
  end
end
