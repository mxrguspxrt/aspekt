module Aspekt
  class Advice

    attr_reader :advice_type, :opts, :block

    def initialize(advice_type, opts, &block)
      @advice_type = advice_type
      @opts = opts
      @block = block
    end

    def pointcuts
      opts.map{|type,methods| Pointcut.new(type, methods) }
    end

    def pointcuts_array
      array = []
      pointcuts.each do |p|
        p.method_names.each do |method_name|
          array << [p.type, method_name]
        end
      end
      array
    end

    def weave
      pointcuts_array.all? do |type, method|
        Aspekt::MethodWeaver.weave(advice_type, type, method)
      end
    end

  end
end
