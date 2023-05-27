# frozen_string_literal: true

require './node'

# class representing a linked list data structure
class LinkedList
  attr_reader :head_node, :tail_node

  def initialize
    @head_node = nil
    @tail_node = nil
  end

  def append(value)
    if @head_node.nil?
      @head_node = @tail_node = Node.new(value)
    else
      new_node = Node.new(value)
      @tail_node.next_node = @tail_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value, @head_node)
    @head_node = new_node
  end

  def size
    count = 0
    current_node = @head_node
    while current_node
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def head
    @head_node
  end

  def tail
    @tail_node
  end

  def at(index)
    current_node = @head_node
    index.times do
      return nil if current_node.next_node.nil?

      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    nil if size < 1

    current_node = @head_node
    until current_node.next_node == @tail_node
      puts current_node.next_node.value
      current_node = current_node.next_node
    end
    @tail_node = current_node
    @tail_node.next_node = nil
  end

  def to_s
    current_node = @head_node
    while current_node
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
      puts 'nil' if current_node.nil?
    end
  end
end

test = LinkedList.new
test.append(3)
test.prepend(12)
test.append(10)
test.append(21)
test.prepend(1)
test.pop
test.to_s
test.at(5)
test.pop
