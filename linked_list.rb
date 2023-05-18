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
        previous_node = current_node
    end
  end

  def prepend(value)
    added_node = Node.new(value, head)
    # if list was empty, head is nil so the added_node has correct next_node value
    change_head(added_node)
    increment_size
  end

  def size
    @size
  end

  def head
    @head
  end

  def at(index)
    return nil unless (0..size - 1).include?(index) && index.integer?

    current_node = @head
    index.times { current_node = current_node.next_node }
    current_node
  end

  def append(value)
    added_node = Node.new(value)
    size.zero? ? change_head(added_node) : at(size - 1).next_node = added_node
    increment_size
  end

  def pop
    return if size.zero?

    popped_node = at(size - 1)
    decrement_size
    at(size - 1).next_node = nil unless size.zero?
    popped_node
  end

  def tail
    at(size - 1)
    # at method already has guard clause in case size = 0
  end

  def contains?(value)
    return false if size.zero?

    current_node = head
    (size - 1).times do
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    return current_node.value == value
  end

  def find(value)
    return if size.zero?

    current_node, current_index = head, 0
    (size - 1).times do
      return current_index if current_node.value == value
      current_node = current_node.next_node
      current_index += 1
    end
    return size - 1 if current_node.value == value
  end 

  def to_s
    output_string = ''
    remaining_elements = size
    current_node = head unless size.zero?
    size.times do
      output_string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    output_string + 'nil'
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

    def self.how_many_nodes
        @@how_many_nodes
    end

end

my_list = LinkedList.new([1,2,3])
my_list.pop
my_list.prepend('prepended')
puts my_list