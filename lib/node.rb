class Node 
  attr_accessor :data, :edges
  def initialize (data)
    @data = data
    @edges = []
  end
  def to_s
    puts "data is #{@data}"
  end

end
    