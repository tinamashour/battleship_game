class Board

  def self.print_grid(arr)
    arr.each do |row|
      puts row.join(" ")
    end
  end

  def initialize(n)
    @grid = Array.new(n){Array.new(n, :N)}
    @size = n * n
  end

  def size
    @size
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def num_ships
    cnt = 0
    @grid.each do |i|
      i.each do |j|
        if (j == :S)
          cnt += 1
        end
      end
    end
    cnt
  end

  def attack(pos)
    if (self[pos] == :S)
      self[pos]= :H
      puts "you sunk my battleship!"
      return true
    else
       self[pos] = :X
      return false
    end
  end

  def place_random_ships
    max_ships = 0.25 * self.size
    while self.num_ships < max_ships
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      pos = [row, col]
      self[pos] = :S
    end

  def hidden_ships_grid
    hidden_grid = Array.new(@grid.length){Array.new(@grid.length)}
    @grid.each_with_index do |val1, idx1|
      val1.each_with_index do |val2, idx2|
        if val2 == :S
          hidden_grid[idx1][idx2] = :N
        else
          hidden_grid[idx1][idx2] = val2
        end
      end
    end
    hidden_grid
    # @grid.map do |row|
    #   row.map do |ele|
    #     if ele == :S
    #       :N
    #     else
    #       ele
    #     end
    #   end
    # end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end




  end
















end
