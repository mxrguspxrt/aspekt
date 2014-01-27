module PlainRubyApp
  class User < BaseModel

    attr_accessor :name, :password

    def initialize(opts)
      @name = opts[:name]
      @password = opts[:password]
    end

    def to_h
      {id: id, name: name, password: password}
    end

  end
end
