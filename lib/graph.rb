class Graph
  attr_accessor :vertex_list

  def initialize 
    @vertex_list = []
  end

  def create_vl
    x_axis = 0 
    y_axis = 0
    vertex_list = Array.new
    while x_axis < 8
      while y_axis < 8
        vertex = Node.new([x_axis, y_axis])
        vertex_list << vertex
        y_axis += 1
      end 
      x_axis += 1
      y_axis = 0
    end
    @vertex_list = vertex_list
    return @vertex_list
  end

  def knight_move(input, move)
    coordinates = Array.new
    if ((input[0] + move[0]) >= 0) && (input[0] + move[0] < 8)
        if ((input[1] + move[1]) >= 0) && (input[1] + move[1] < 8)
            coordinates << (input[0] + move[0])
            coordinates << (input[1] + move[1])
            return coordinates
        end
    end
  end
  def move_options(starting_coordinates)
    moves = Array.new
    moves << knight_move(starting_coordinates, [2,1]) 
    moves << knight_move(starting_coordinates, [-2,1])
    moves << knight_move(starting_coordinates, [2,-1])
    moves << knight_move(starting_coordinates, [-2,-1])
    moves << knight_move(starting_coordinates, [1,2])
    moves << knight_move(starting_coordinates, [1,-2])
    moves << knight_move(starting_coordinates, [-1,2])
    moves << knight_move(starting_coordinates, [-1,-2])
    moves.compact!
    moves
  end
end