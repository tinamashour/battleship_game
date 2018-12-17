require_relative "board"
require_relative "player"

class Battleship
  def initialize(len_of_board)
    @player = Player.new()
    @board = Board.new(len_of_board)
    @remaining_misses = @board.size / 2
  end

  def board
    @board
  end

  def player
    @player
  end

  def start_game
    @board.place_random_ships
    puts @board.num_ships
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      return true
    end
     false
  end

  def win?
    if @board.num_ships == 0
      puts "you win"
      return true
    end
    false
  end

  def game_over?
    return true if win? || lose?
    false
  end

  def turn
    pos = @player.get_move
    if !@board.attack(pos)
      @remaining_misses -= 1
    end
    puts @remaining_misses
    @board.print
  end










end
