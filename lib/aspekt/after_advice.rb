module Aspekt
  class AfterAdvice < Advice

    def weave
      pointcuts_array.each do |type, method_name|
        MethodWeaver.new.weave_after(type, method_name, &block)
      end
    end

  end
end
