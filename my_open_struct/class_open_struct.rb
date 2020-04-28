module MyOpenStruct
  class ClassOpenStruct
    class << self
      def init(hash = { a: 1, b: 2, c: 3 })
        @@hash = hash.dup
      end

      def method_missing(method_name, *args)
        if @@hash.keys.include?(method_name)
          (class << self; self; end).instance_eval do
            define_method method_name do
              @@hash[method_name]
            end
          end

          @@hash[method_name]
        else
          super
        end
      end

      def respond_to_missing?(method_name, *args)
        @@hash.keys.include?(method_name) || super
      end
    end
  end
end
