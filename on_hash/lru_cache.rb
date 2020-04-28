module OnHash
  class LRUCache
    attr_reader :max_number

    def initialize(max_number)
      @max_number = max_number

      @store = {}
    end

    def get(key)
      touch(key) if exist?(key)
    end

    def set(key, value)
      remove(key) # if exist?(key)
      add(key, value)
    end

    private

    attr_reader :store

    def touch(key)
      value      = remove(key)
      store[key] = value
    end

    def exist?(key)
      store.key?(key)
    end

    def remove(key)
      store.delete(key)
    end

    def add(key, value)
      store.shift if store.size >= max_number

      store[key] = value
    end
  end
end
