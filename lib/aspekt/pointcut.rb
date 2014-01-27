module Aspekt
  class Pointcut

    attr_reader :type, :method_names

    def initialize(type, *method_names)
      @type = type
      @method_names = method_names.flatten.compact
    end

  end
end
