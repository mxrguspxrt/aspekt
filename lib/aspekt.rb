libdir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "aspekt/pointcut"
require "aspekt/joinpoint"
require "aspekt/method_weaver"
require "aspekt/advice"
require "aspekt/before_advice"
require "aspekt/after_advice"
require "aspekt/around_advice"

module Aspekt
  def before(opts, &block)
    BeforeAdvice.new(opts, &block).weave
  end
  def after(opts, &block)
    AfterAdvice.new(opts, &block).weave
  end
  def around(opts, &block)
    AroundAdvice.new(opts, &block).weave
  end
end
