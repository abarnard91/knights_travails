require_relative("lib/graph.rb")
require_relative("lib/node.rb")

test = Graph.new

test.create_vl

test.vertex_list.length.times do |i|
    puts "#{test.vertex_list[i].data}"
   
end


#puts "#{first_move}"
#puts "#{spm}"
