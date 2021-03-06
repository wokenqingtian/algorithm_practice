class BinarySearchTree
  class Node
    attr_reader :key, :left, :right

    def initialize(key)
      @key = key
      @left = nil
      @right = nil
    end

    def insert(new_key)
      if new_key <= @key
        @left.nil? ? @left = Node.new(new_key) : @left.insert(new_key)
      elsif new_key > @key
        @right.nil? ? @right = Node.new(new_key) : @right.insert(new_key)
      end
    end
  end

  def initialize
    @root = nil
  end

  def insert(key)
    @root.nil? @root = Node.new(key) : @root.insert(key)
  end

  def in_order(node=@root, &block)
    return if node.nil?
    in_order(node.left, &block)
    yield node
    in_order(node.right, &block)
  end

  def pre_order(node=@root, &block)
    return if node.nil?
    yield node
    pre_order(node.left, &block)
    pre_order(node.right, &block)
  end

  def post_order(node=@root, &block)
    return if node.nil?
    post_order(node.left, &block)
    post_order(node.right, &block)
    yield node
  end

  def search(node, key)
    if key < node.key
      search(node.left, key)
    elsif key > node.key
      search(node.right, key)
    else
      node
    end
  end

  def check_height(node=@root)
    return 0 if node.nil?

    leftHeight = check_height(node.left)
    return -1 if leftHeight == -1

    rightHeight = check_height(node.right)
    return -1 if rightHeight == -1

    diff = leftHeight - rightHeight
    if diff.abs > 1
      -1
    else
      [leftHeight, rightHeight].max + 1
    end
  end

  def is_balanced?(node=@root)
    check_height(node) == -1 ? false : true
  end
end

