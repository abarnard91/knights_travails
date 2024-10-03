class Graph
  attr_accessor :vertex_list

  def initialize 
    @vertex_list = []
    @move_options_arr = [[2,1],[-2,1],[2,-1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
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
    @move_options_arr.each do |move|
      moves << knight_move(starting_coordinates, move)
    end
    moves.compact!
    moves.each do |move| #iterate through moves array
      @vertex_list.each do |vertex| #iterate through vertex list
        if vertex.data == move #if current move matches a vertex coordinate add that coordinate as an edge by
          @vertex_list.each do |v| #iterate through vertex list to find the node that matches with the starting coordinates
            if v.data == starting_coordinates #find the node that matches the starting coordinates
              v.edges << vertex #add vertex node to starting coordinate node.edge
            end
          end
        end
      end
    end
    #moves
  end

  def traversal(start_place, end_place)
    sc = nil
    @vertex_list.each do |v|
      if start_place == v.data
        sc = v
      end
    end
    if sc.nil?
        return "Starting coordinates not found"
    end
    puts sc
  end

end