module MyOpenStruct
  class OpenStruct
    def initialize(hash = { a: 1, b: 2, c: 3 })
      @orig_hash = hash
      @hash      = hash.dup # deep_dup? : just in case to emulate #rehash method from hash class
    end

    def method_missing(method_name, *args)
      if hash.keys.include?(method_name)
        define_singleton_method method_name do
          hash[method_name]
        end

        hash[method_name]
      else
        super
      end
    end

    def respond_to_missing?(method_name, *args)
      hash.keys.include?(method_name) || super
    end

    private

    attr_reader :hash, :orig_hash
  end
end
