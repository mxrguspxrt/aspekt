module Aspekt
  class MethodWeaver

    def self.weave(advice_type, type, method_name, &block)
      send("weave_#{advice_type}", type, method_name, &blocks)
    end

    def self.weave_around(type, method_name, &block)
      method_orginal = type.instance_method(method_name)

      type.send(:define_method, method_name) do |*method_arguments, &method_block|
        bound_method = method_orginal.bind(self)
        joinpoint = Joinpoint.new(
          type: type,
          instance: self,
          method_name: method_name,
          arguments: method_arguments,
          block: method_block,
          orginal_method: method_orginal,
          bound_method: bound_method
          )
        block.call(joinpoint)
      end
    end

    def self.weave_before(type, method_name, &block)
      weave_around(type, method_name) do |joinpoint|
        block.call(joinpoint)
        joinpoint.proceed
      end
    end

    def self.weave_after(type, method_name, &block)
      weave_around(type, method_name) do |joinpoint|
        joinpoint.proceed
        block.call(joinpoint)
      end
    end

  end
end
