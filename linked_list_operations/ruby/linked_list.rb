class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # Add a new node at the end of the list
  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node = new_node
    end
  end

  # Add a new node at the beginning of the list
  def prepend(value)
    @head = Node.new(value, @head)
  end

  # Remove a node by value
  def delete(value)
    return @head = @head.next_node if @head.value == value

    current = @head
    while current.next_node && current.next_node.value != value
      current = current.next_node
    end

    current.next_node = current.next_node.next_node if current.next_node
  end

  # Search for a node by value
  def search(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  # Traverse the list and print each value
  def print_list
    current = @head
    while current
      print "#{current.value} -> "
      current = current.next_node
    end
    puts "nil"
  end
end

# Example usage:
list = LinkedList.new
list.append(10)
list.append(20)
list.append(30)
list.prepend(5)
list.print_list
puts "Does 20 exist in the list? #{list.search(20)}"
list.delete(20)
list.print_list
