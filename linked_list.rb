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
      @tail_node.next_node = @tail_node =  new_node
      # @tail_node = new_node
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
end
