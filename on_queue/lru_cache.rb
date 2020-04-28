class LRUCache
  attr_reader :max_number

  delegate :exist?, :add, :remove, to: :store
  delegate :exist?, :add, :remove, to: :store

  def initialize(max_number)
    @max_number = max_number

    @store = LRUStore.new
    @queue = LRUQueue.new
  end

  def get(key)
    node = touch(key)

    node&.value
  end

  def set(key, value)
    remove(key)

    node = add(key, value)

    node.value
  end

  def remove(key)
    return unless exist?(key)

    node = store.remove(key)
    queue.remove(node)

    decrement_size!

    node.value
  end

  private

  attr_reader :store, :queue

  def touch(key)
    return unless exist?(key)

    node = store.get(key)

    queue.remove(node)
    queue.add(node)

    node
  end

  def add(key, value)
    node = store.add(key, value)

    queue.add(node)

    increment_size!
  end

  def increment_size!
    @size += 1
  end

  def decrement_size!
    @size -= 1
  end
end
