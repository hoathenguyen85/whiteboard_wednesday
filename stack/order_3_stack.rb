require_relative 'stack'

# order with biggest on bottom and smallest on top
def stack_order(unordered_stack)
  # This stack will be sorted
  ordered_stack = MyStack.new()
  # a temporary place to hold the node to help find it's right place
  # in the ordered stack
  temp_node = nil
  # stack to temporarily hold ordered stack when finding the right place
  # for the temp_node
  temp_stack = MyStack.new()

  print_step(unordered_stack, ordered_stack, temp_node)

  # pop unordered stack into temp_node until unordered stack is empty
  until(unordered_stack.empty?)
    temp_node = unordered_stack.pop

    print_step(unordered_stack, ordered_stack, temp_node)

    # when temp_node is smaller than top node of ordered_stack
    # or ordered_stack is empty, push temp_node in
    until(ordered_stack.empty? || temp_node.data < ordered_stack.top.data)
      unordered_stack.push(ordered_stack.pop)
      print_step(unordered_stack, ordered_stack, temp_node)
    end

    print_step(unordered_stack, ordered_stack, temp_node)

    ordered_stack.push(temp_node)
    temp_node = nil

    print_step(unordered_stack, ordered_stack, temp_node)

    # put temp_stack back into ordered_stack
    until(unordered_stack.empty? || unordered_stack.top.data > ordered_stack.top.data)
      ordered_stack.push(unordered_stack.pop)
      print_step(unordered_stack, ordered_stack, temp_node)
    end

    print_step(unordered_stack, ordered_stack, temp_node)
  end

  # stack is now ordered!
  return ordered_stack
end


def print_step(unordered_stack, ordered_stack, temp_node)

  print "\e[H\e[2J"
  puts "#{unordered_stack.empty? ? 'nil' : unordered_stack.top.print_node}"
  puts "#{ordered_stack.empty? ? 'nil' : ordered_stack.top.print_node}"
  puts "Node: #{temp_node.nil? ? 'nil' : temp_node.data}"
  puts
  puts '----------------------------------'
  puts

  sleep(2)
  print "\e[H\e[2J"
end


node1 = Node.new(1)
node2 = Node.new(2)
node2a = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(6)
node7 = Node.new(7)
node8 = Node.new(8)
node9 = Node.new(9)
node10 = Node.new(10)

unordered_stack = MyStack.new(node1)
unordered_stack.push(node6)
unordered_stack.push(node2)
unordered_stack.push(node3)
unordered_stack.push(node2a)
unordered_stack.push(node5)
unordered_stack.push(node4)
unordered_stack.push(node10)

ordered_stack = stack_order(unordered_stack)
