require_relative("lib/graph.rb")
require_relative("lib/node.rb")

test = Graph.new

test.create_vl

test.vertex_list.each do |v|
  test.move_options(v.data)
end

test.traversal([3,3], [0,0])
test.traversal([0,0],[1,2])
test.traversal([0,0], [7,7])