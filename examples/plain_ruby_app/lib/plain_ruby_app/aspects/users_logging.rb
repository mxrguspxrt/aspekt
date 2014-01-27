module PlainRubyApp
  include ::Aspekt

  before User => :save do |joinpoint|
    Logger.info("Before #{joinpoint.method_name} on #{joinpoint.instance.to_h} with #{joinpoint.arguments}")
  end

  after User => :save do |joinpoint|
    Logger.info("After #{joinpoint.method_name} on #{joinpoint.instance.to_h} with #{joinpoint.arguments} and result was #{joinpoint.return_value}")
  end

  around User => [:save, :destroy], User.singleton_class => :new do |joinpoint|
    Logger.info("Before around #{joinpoint.method_name} on #{joinpoint.instance.to_h} with #{joinpoint.arguments}")
    joinpoint.proceed
    Logger.info("After around #{joinpoint.method_name} on #{joinpoint.instance.to_h} with #{joinpoint.arguments} and result was #{joinpoint.return_value}")
    joinpoint.return_value # Must return orginal value!
  end

end
