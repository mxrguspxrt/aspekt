module PlainRubyApp
  class BaseModel

    attr_reader :id

    def self.generate_id
      @id_counter ||= 0
      @id_counter += 1
    end

    def initialize(opts)
      opts.each {|k,v| send("#{k}=", v) }
    end

    def save
      @id ? update : create
    end

    def create
      @id = self.class.generate_id
      true
    end

    def update
      true
    end

    def destroy
      @id = nil
      true
    end

    def to_h
      {id: id}
    end

  end
end
