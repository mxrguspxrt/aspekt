module Aspekt
  class BeforeAdvice < Advice

    def weave
      pointcuts_array.each do |type, method_name|
        MethodWeaver.new.weave_before(type, method_name, &block)
      end
    end

  end
end
