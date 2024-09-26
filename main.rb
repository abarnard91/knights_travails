require_relative("lib/graph.rb")
require_relative("lib/node.rb")



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
i=0
spm = []
thrdpm = []
first_move = move_options([1,0])
first_move.each do |x|
    puts "#{x}"
    spm << move_options(x)
    #spm.uniq!
    puts "#{spm[i]}"
    i+=1
end 
# spm.each do |x|
#     puts "#{x}"
#     thrdpm << move_options(x)
# end

puts "#{first_move}"
#puts "#{spm}"
#puts "#{thrdpm}"