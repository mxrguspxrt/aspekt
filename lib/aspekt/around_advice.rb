module Aspekt
  class AroundAdvice < Advice

    def weave
      pointcuts_array.each do |type, method_name|
        MethodWeaver.new.weave_around(type, method_name, &block)
      end
    end

  end
end
