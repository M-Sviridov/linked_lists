# frozen_string_literal: true

require './linked_list'

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
test.insert_at(1000, 2)
test.to_s
test.pop
test.to_s
test.pop
test.pop
test.to_s
test.remove_at(0)
test.at(7)
test.to_s
test.remove_at(5)
test.to_s
