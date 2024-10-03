require_relative("lib/graph.rb")
require_relative("lib/node.rb")

test = Graph.new

test.create_vl

#test.vertex_list.length.times do |i|
#    puts "#{test.vertex_list[i].data}"
#end

test.vertex_list.each do |v|
  test.move_options(v.data)
end

# test.vertex_list.each do |vertex|
#   puts "vertex:"
#   vertex.to_s
#   vertex.edges.each do |edge|
#     puts "edge:"
#     edge.to_s
#   end
#   puts "break"
# end
#test.move_options(test.vertex_list[2].data)
#test.vertex_list[27].edges.each do |i|
  #puts "vertex:#{test.vertex_list[27].data} edge:#{i.data}"
  #puts i.edges
#end
#

test.traversal([3,3], [7,2])