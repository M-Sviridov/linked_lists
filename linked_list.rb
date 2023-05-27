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
    current_node = current_node.next_node until current_node.next_node == @tail_node
    @tail_node = current_node
    @tail_node.next_node = nil
  end

  def contains?(value)
    current_node = @head_node
    while current_node
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    count = 0
    current_node = @head_node
    while current_node
      return count if current_node.value == value

      count += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    current_node = @head_node
    while current_node
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
      puts 'nil' if current_node.nil?
    end
  end

  def insert_at(value, index)
    if index.zero?
      new_node = Node.new(value, @head_node.next_node)
      @head_node.next_node = new_node
    elsif index == size - 1
      current_node = @head_node
      new_node = Node.new(value, @tail_node)
      (index - 1).times do
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    else
      current_node = @head_node
      new_node = Node.new(value)
      (index - 1).times do
        current_node = current_node.next_node
      end
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
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
test.insert_at(100, 0)
test.to_s
test.insert_at(50, test.size - 1)
test.to_s
test.insert_at(75, 3)
test.to_s