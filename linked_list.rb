# The Linked List class contains methods for linked lists
class LinkedList
  
  attr_reader :size, :head
  
  def initialize(values_array = [])
    previous_node = nil
    @head = nil
    @size = values_array.size
    values_array.each_with_index do |value, index|
        current_node = Node.new(value)
        index.zero? ? change_head(current_node) : previous_node.next_node = current_node
        # either we are dealing with the head node or there is a previous node, but not both
        previous_node = current_node
    end
  end

  def size
    @size
  end

  def head
    @head
  end

  def at(index)
    return nil unless (0..size - 1).include?(index) && index.integer?
    # makes sure the index supplied is valid, return nil otherwise

    current_node = @head
    index.times { current_node = current_node.next_node }
    # head has index zero, so we need to move to the next node index times
    current_node
  end

  def tail
    at(size - 1)
    # at method already has guard clause in case size = 0
  end

  def list_each_with_index(default_output = nil)
    return default_output if size.zero?
    
    current_node, current_index = head, 0
    size.times do
      yield current_node, current_index
      current_node = current_node.next_node
      current_index += 1
    end
  end
  
  def contains?(value)
    list_each_with_index(false) { |node, index| return true if node.value == value }
    false
    # returns false only if none of the nodes had the required value
  end

  def find(value)
    list_each_with_index(nil) { |node, index| return index if node.value == value }
    nil
    # returns nil if list is empty or if no node had the required value
  end
    
  def to_s
    output_string = ''
    list_each_with_index { |node| output_string += "( #{node.value} ) -> " }
    output_string + 'nil'
  end
  
  def insert_at(value, index)
    return 'Error, index not valid' unless (0..size).include?(index) && index.integer?
    # checks index provided will fit in the given list

    node_to_add = Node.new(value, at(index))
    # if index = size, at(index) returns nil which is correct

    index.zero? ? change_head(node_to_add) : at(index - 1).next_node = node_to_add
    # either we insert a new head or previous node has link changed but not both
    increment_size
  end

  def remove_at(index)
    return unless (0..size - 1).include?(index) && index.integer?
    # checks index provided appears in the given list

    removed_node = at(index)
    index.zero? ? change_head(at(1)) : at(index - 1).next_node = removed_node.next_node
    # if list had only one node, at(1) is nil so head becomes nil.
    # similarly if index = size - 1 the removed node had next_node = nil so this
    # property transfers to the previous node
    decrement_size
    removed_node
  end

  def prepend(value)
    insert_at(value, 0)
  end

  def append(value)
    insert_at(value, size)
  end

  def pop
    remove_at(size - 1)
  end
  
  private
  
  def change_head(node)
    @head = node
  end

  def increment_size
    @size = size + 1
  end

  def decrement_size
    @size = size - 1
  end

end

# The Node class contains methods for nodes of a linked list
class Node
    
    attr_accessor :value, :next_node
    
    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

my_list = LinkedList.new([1,2,3,4])
p my_list.pop
my_list.prepend(0)
puts my_list