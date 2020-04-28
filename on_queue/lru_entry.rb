class LRUEntry
  attr_accessor :value, :left_node, :right_node

  def initialize(value)
    @value = value
  end
end

class LRUStore
  def initialize
    @store = {}
  end

  def exist?(key)
    store.key?(key)
  end

  def remove(key)
    store.delete(key)
  end

  def add(key, value)
    store[key] = LRUEntry.new(value)
  end

  def get(key)
    store[key]
  end

  private

  attr_reader :store
end
