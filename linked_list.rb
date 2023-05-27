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
    new_node = Node.new(value)
    if @head_node.nil?
      @head_node = @tail_node = new_node
    else
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

    current_node = at(size - 2) # gets the node before the current tail node
    current_node.next_node = nil
    @tail_node = current_node
  end

  def contains?(value, current_node = @head_node)
    return true if current_node.value == value
    return false if current_node == tail

    contains?(value, current_node.next_node)
  end

  def find(value, current_node = @head_node, count = 0)
    return count if current_node.value == value
    return nil if current_node == tail

    count += 1
    find(value, current_node.next_node, count)
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
    new_node = Node.new(value)
    current_node = at(index)
    previous_node = at(index - 1)
    if index.zero?
      new_node.next_node = current_node
      @head_node = new_node
    else
      previous_node.next_node = new_node
      new_node.next_node = current_node
    end
  end
end
