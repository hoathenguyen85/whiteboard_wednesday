require_relative 'stack'

# order with biggest on bottom and smallest on top
def stack_order(unordered_stack)
  # This stack will be sorted
  ordered_stack = MyStack.new()
  # stack to temporarily hold ordered stack when finding the right place
  # for the temp_node
  temp_stack = MyStack.new()

  print_step(unordered_stack, ordered_stack, temp_stack)

  # pop unordered stack into temp_node until unordered stack is empty
  until(unordered_stack.empty?)

    if(!ordered_stack.empty? && unordered_stack.top.data < ordered_stack.top.data)
      ordered_stack.push(unordered_stack.pop)
    end

    print_step(unordered_stack, ordered_stack, temp_stack)


    # when top node of unordered stack is smaller than top node of ordered_stack
    # or ordered_stack is empty, push top node of unordered stack in
    if(!unordered_stack.empty?)
      until(ordered_stack.empty? || unordered_stack.top.data < ordered_stack.top.data)
        temp_stack.push(ordered_stack.pop)
        print_step(unordered_stack, ordered_stack, temp_stack)
      end

    print_step(unordered_stack, ordered_stack, temp_stack)

    ordered_stack.push(unordered_stack.pop)

    print_step(unordered_stack, ordered_stack, temp_stack)

    end

    # put temp_stack back into ordered_stack
    until(temp_stack.empty?)
      ordered_stack.push(temp_stack.pop)
      print_step(unordered_stack, ordered_stack, temp_stack)
    end

    print_step(unordered_stack, ordered_stack, temp_stack)
  end

  # stack is now ordered!
  return ordered_stack
end


def print_step(unordered_stack, ordered_stack, temp_stack)

  print "\e[H\e[2J"
  puts "#{unordered_stack.empty? ? 'nil' : unordered_stack.top.print_node}"
  puts "#{ordered_stack.empty? ? 'nil' : ordered_stack.top.print_node}"
  puts "#{temp_stack.empty? ? 'nil' : temp_stack.top.print_node}"
  puts
  puts '----------------------------------'
  puts

  sleep(2)
  print "\e[H\e[2J"
end


node1 = Node.new(1)
node2 = Node.new(2)
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
unordered_stack.push(node10)

ordered_stack = stack_order(unordered_stack)
