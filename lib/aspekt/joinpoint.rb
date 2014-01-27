module Aspekt
  class Joinpoint

    attr_reader :type, :instance, :method_name, :arguments, :block, :return_value, :orginal_method, :bound_method

    def initialize(opts)
      @type = opts[:type]
      @instance = opts[:instance]
      @method_name = opts[:method_name]
      @arguments = opts[:arguments]
      @block = opts[:block]
      @return_value = opts[:return_value]
      @orginal_method = opts[:orginal_method]
      @bound_method = opts[:bound_method]
    end

    def proceed
      @return_value = bound_method.call(*arguments, &@block)
    end

  end
end
