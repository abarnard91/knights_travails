class Graph
  attr_accessor :vertex_list

  def initialize 
    @vertex_list = []
    @move_options_arr = [[2,1],[-2,1],[2,-1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
  end

  def create_vl #creates a list of all possible locations (coordinates) on the chess board
    x_axis = 0 
    y_axis = 0
    while x_axis < 8
      while y_axis < 8
        vertex = Node.new([x_axis, y_axis])
        @vertex_list << vertex
        y_axis += 1
      end 
      x_axis += 1
      y_axis = 0
    end
    return @vertex_list
  end

  def knight_move(input, move) #creates new coordinates within the range of 0-7 so the night doesnt go off the board
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
  end

  def c_2_n(c) #coordinates to node
    @vertex_list.each do |v|
      if v.data == c
        c = v
        break
      end
    end
    c = "Coordinates not found" unless c.is_a?(Node)
    return c
  end

  def traversal(start_place, end_place)
    sc = self.c_2_n(start_place) #starting coordinates in node class
    ec = self.c_2_n(end_place) #ending coordinates in node class
    
    visited_vertices = Array.new
    moves = Array.new 
    queue = Array.new
    parent_vertex = nil
    
    until sc == ec #loop of bft of graph 
      queue << sc
      queue.each do |vertex|#iterate through vertices
        visited_vertices << vertex unless visited_vertices.include?(vertex) #add to visited vertices list so infinite loops of the same vertex/edges arent produced
        parent_vertex = vertex #to store the vertex of the edge that is the end coordinate
        if vertex == ec # ie if the end place is one move or less away
          moves.unshift(vertex) 
          break
        else
          vertex.edges.each do |edge| #iterate through the edges of the current vertex in the queue
            if edge == ec #if the current vertex contains an edge to the endplace vertext
              moves.unshift(edge) #add edge to the beginning of moves list
              break
            else
              queue << edge unless visited_vertices.include?(edge) #otherwise add edges to the queue to iterate over as the next vertex
            end
          end
          parent_vertex = nil unless moves[0] == ec #if none of the edges connect to the end space vertex forget the current vertex and assign it to the next vertex in the queue
        end
        if moves[0] == ec #if the edge of the vertex is the end place coordinate
          ec = parent_vertex #end place node becomes the parent vertex for the next round 
          parent_vertex = nil# and everything is reset. this builds the path backwards and eventually breaks the while(until) loop
          queue = []
          visited_vertices = []
          break   
        end
      end
    end
    moves.unshift(sc) #adds the starting coordinate to the moves list as the first "move"
    moves.map!(&:data) #pulls out just the coordinates from the moves list for easier reading
    puts "path from #{start_place} to #{end_place}"
    puts "number of moves = #{moves.length-1} \nmoves: #{moves}"
  end
end









#queue.each do |move|
  #     visited_verticies << move unless visited_verticies.include?(move)
  #     moves << move unless moves.include?(move)
  #     if move.data == end_place
  #       puts "hi"
  #       sc.edges.each do |e|
  #         puts "moves[1] is #{moves[1].data} and e is #{e.data}"
  #         if moves[1] == e
  #           moves.map!{|vertex| vertex.data}
  #           loms << moves unless loms.include?(moves)
  #         end
  #       end
  #       moves = [sc]
  #       break
  #       puts "Why are you seeing this!"
  #     else
  #       move.edges.each do |edge|
  #         if edge.data == end_place
  #           #puts "from edges"
  #           moves << edge 
  #           sc.edges.each do |e|
  #             puts "moves[1] is #{moves[1].to_s} and e is #{e.data}"
  #             if moves[1] == e
  #               moves.map!{|vertex| vertex.data}
  #               loms << moves unless loms.include?(moves)
  #             end
  #           end
  #           # moves.map!{|vertex| vertex.data}
  #           # loms << moves unless loms.include?(moves)
  #           moves = [sc]
  #           break
  #           puts "You shouldn\'t see this"
  #         else
  #           if queue.include?(edge) || visited_verticies.include?(edge) 
  #             #puts "its already there"
  #           else
  #             queue << edge
  #             #puts "added #{edge.data}"
  #           end
  #         end
  #       end
  #     end
  #   end
  #   queue.shift
  # end

  #spl = 65 #shortest path length starts at 65 b/c it cant be bigger than that without retreading on spaces
  #   spi = 0 #shortest path index
  #  moves.each_with_index do |move_set, i|
  #   #puts "#{i} #{move_set}"

  #   if move_set.length < spl
  #     spl = move_set.length 
  #     spi = i 
  #   end