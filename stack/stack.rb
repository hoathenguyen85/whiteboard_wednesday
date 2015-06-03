class Node
  # data = the data in this node
  # node_next = what is the next node I am pointing at?
  #             if nil then there is no next node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
  end

  def has_next_node?
    !next_node.nil?
  end

  def print_node
    print " |#{@data}| "
    if has_next_node?
      print "=> "
      print "#{@next_node.print_node}" 
    else
      print " => nil"
    end
    
  end

  def to_s
    @data
  end
end

class MyStack
  # top = what is on top of the stack at this very moment
  # size = how big is the stack at this very moment
  attr_accessor :top, :size

  def initialize(node=nil)
    # set the top to be whatever the node is
    @top = node
    # set the size, if a node got put in then size is one....else it is empty
    @size = empty? ? 0 : 1
  end

  def empty?
    @top.nil?
    # since I implemented size...could have done @size == 0
    # design choice of how you want to implement stack
  end

  def push(new_node)
    # set new node as top if empty
    if empty?
      @top = new_node
    else
      # @top at this moment will have something on top of it
      # puts new node on top of @top
      new_node.next_node = @top
      # new node becomes the new top of the stack
      @top = new_node
    end

    # new node got added so increment size
    @size = @size + 1

    @top
  end

  def pop
    # get the node on top
    popped_node = @top

    unless popped_node.nil?
      # set the node under @top to be the new top node,
      # which pops off the popped_node
      @top = popped_node.next_node

      # popped_node should point to nothing 
      popped_node.next_node = nil

      # node got popped....so decrement size by one
      @size = @size - 1
    end

    popped_node
  end
end