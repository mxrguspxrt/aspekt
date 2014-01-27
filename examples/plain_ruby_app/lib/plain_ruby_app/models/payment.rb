module PlainRubyApp
  class Payment < BaseModel

    attr_accessor :user, :amount, :currency

    def initialize(opts)
      @user = opts[:user]
      @amount = opts[:amount]
      @currency = opts[:currency]
    end

    def to_h
      {id: id, user: user, amount: amount, currency: currency}
    end

  end
end
