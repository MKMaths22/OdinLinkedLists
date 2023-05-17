# The Linked List class contains methods for linked lists
class LinkedList
  def initialize(values_array = [])
    previous_node = nil
    values_array.each_with_index do |value, index|
        current_node = Node.new(value)
        previous_node.next_node = current_node if previous_node
        previous_node = current_node
    end

  end



end

# The Node class contains methods for nodes of a linked list
class Node
    
    @@how_many_nodes = 0
    
    attr_accessor :value, :next_node
    
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
        @@how_many_nodes += 1
    end

    def self.how_many_nodes
        @@how_many_nodes
    end

end

my_list = LinkedList.new([1,2,3])
puts Node.how_many_nodes