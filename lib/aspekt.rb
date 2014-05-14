libdir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "aspekt/pointcut"
require "aspekt/joinpoint"
require "aspekt/method_weaver"
require "aspekt/advice"

module Aspekt
  def before(opts, &block)
    Advice.new(:before, opts, &block).weave
  end
  def after(opts, &block)
    Advice.new(:after, opts, &block).weave
  end
  def around(opts, &block)
    Advice.new(:around, opts, &block).weave
  end
end
