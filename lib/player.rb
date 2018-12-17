class Player
  def get_move
    puts "enter a position with coordinates separated
    with a space like `4 7`"
    usr_input = gets.chomp
    usr_input = usr_input.split(" ")
    # returns array includes of position
    usr_input.map {|i| i.to_i}
  end
end
