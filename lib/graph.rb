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
    sc = nil #starting coordinates
    visited_verticies = Array.new
    moves = Array.new 
    queue = Array.new
    loms = Array.new #list of move sets
    @vertex_list.each do |v|
      if start_place == v.data
        sc = v
        visited_verticies.push(sc)
        queue.push(sc)
        moves.push(sc)
      end
    end
    if sc.nil?
        return "Starting coordinates not found"
    end

    until queue.empty? 
    #10.times do
      #puts queue.length
      queue.each do |move|
        #puts move
        visited_verticies << move unless visited_verticies.include?(move)
        moves << move unless moves.include?(move)
        if move.data == end_place
          moves.map!{|vertex| vertex.data}
          loms << moves unless loms.include?(moves)
          moves = [sc]
          break
          puts "Why are you seeing this!"
        else
          #puts "HIIIIII"
          move.edges.each do |edge|
            if edge.data == end_place
              moves << edge 
              moves.map!{|vertex| vertex.data}
              loms << moves unless loms.include?(moves)
              moves = [sc]
              break
              puts "You shouldn\'t see this"
            else
              if queue.include?(edge) || visited_verticies.include?(edge) 
                #puts "its already there"
              else
                queue << edge
                #puts "added"
              end
            end
          end
        end
      end
      queue.shift
    end
    spl = 65 #shortest path length
    spi = 0
   loms.each_with_index do |move_set, i|
    puts "#{i} #{move_set}"

    if move_set.length < spl
      spl = move_set.length 
      spi = i #shortest path index
    end
   end
   puts "#{spl} #{loms[spi]}"
  end
  
end