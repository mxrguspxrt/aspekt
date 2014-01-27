module Aspekt
  class Advice

    attr_reader :opts, :block

    def initialize(opts, &block)
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
      raise "must be defined in subclass"
    end

  end
end
