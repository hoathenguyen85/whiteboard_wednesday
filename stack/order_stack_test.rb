require_relative 'order_stack'

describe Node do
  let(:a_node) {Node.new('a')}
  let(:b_node) {Node.new('b')}

  context '#initialize' do
    it "is a Node class" do
      expect(a_node.instance_of?(Node)).to eq(true)
    end

    it "has a data set" do
      expect(a_node.data).to eq('a')
    end

    it "has no next node" do 
      expect(a_node.has_next_node?).to eq(false)
    end

    it "has next node" do 
      a_node.next_node = b_node
      expect(a_node.has_next_node?).to eq(true)
    end
  end
end

describe MyStack do
  let(:a_node) {Node.new('a')}
  let(:b_node) {Node.new('b')}
  let(:empty_stack) {MyStack.new}
  let(:a_stack) {MyStack.new(a_node)}

  context '#initialize' do
    it "is a Stack class" do
      expect(empty_stack.instance_of?(MyStack)).to eq(true)
    end

    it "initialized empty" do
      expect(empty_stack.size).to eq(0)
    end

    it "initialized with a node on top" do
      expect(a_stack.size).to eq(1)
    end
  end

  context '#push' do
    it "is defined" do
      expect(MyStack.method_defined?(:push)).to eq(true)
    end

    it 'should return node added to stack' do
      expect(empty_stack.push(a_node)).to eq(a_node)
    end

    it 'should increment size by one' do
      empty_stack.push(a_node)
      a_stack.push(b_node)
      expect(empty_stack.size).to eq(1)
      expect(a_stack.size).to eq(2)
    end
  end

  context '#pop' do
    it "is defined" do
      expect(MyStack.method_defined?(:pop)).to eq(true)
    end

    it 'should return node removed top of the stack' do
      expect(a_stack.pop).to eq(a_node)
    end

    it 'should decrement size by one' do
      a_stack.pop
      expect(a_stack.size).to eq(0)
    end
  end
end

describe '#order_stack' do
  let(:node1) {Node.new(1)}
  let(:node2) {Node.new(2)}
  let(:node3) {Node.new(3)}
  let(:node4) {Node.new(4)}
  let(:node5) {Node.new(5)}
  let(:node6) {Node.new(6)}
  let(:node7) {Node.new(7)}
  let(:node8) {Node.new(8)}
  let(:node9) {Node.new(9)}
  let(:node10) {Node.new(10)}

  it 'should sort a small unordered stack' do
    small_unordered_stack = MyStack.new(node1)
    small_unordered_stack.push(node6)
    small_unordered_stack.push(node2)
    small_unordered_stack.push(node10)

    # one way of testing the stack is ordered
    # test each node and see where they are pointing to
    small_ordered_stack = stack_order(small_unordered_stack)
    expect(small_ordered_stack.top).to eq(node1)
    expect(node1.next_node).to eq(node2)
    expect(node2.next_node).to eq(node6)
    expect(node6.next_node).to eq(node10)
    expect(node10.next_node).to eq(nil)
  end
end