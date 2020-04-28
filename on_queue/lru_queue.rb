class LRUQueue
  def initialize
    @size = 0
  end

  def touch(node)
    remove(node)
    add(node)

    node
  end

  def add(node)
    add_node_first(node)

    self.size += 1

    node
  end

  def shift
    raise 'You are not allowed to delete a node from empty queue' if size.zero?

    node = last_node

    self.last_node = last_node.left_node
    last_node.right_node = nil

    self.size -= 1

    node
  end

  def remove(node)
    @first_node = node.right_node if first_node == node
    @last_node  = node.left_node if last_node == node

    node.left_node.right_node = node.right_node if node.left_node
    node.right_node.left_node = node.left_node if node.right_node

    node.left_node  = nil
    node.right_node = nil
  end

  private

  attr_reader :first_node, :last_node, :size

  def add_node_first(node)
    node.left_node  = nil
    node.right_node = first_node

    first_node.left_node = node if first_node

    @first_node = node
  end
end
