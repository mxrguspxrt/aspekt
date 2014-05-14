require 'spec_helper'

describe Aspekt::Joinpoint do 

  let(:type) { double("type") }
  let(:instance) { double("instance") }
  let(:method_name) { double("method_name") }
  let(:arguments) { double("arguments") }
  let(:block) { proc {} }
  let(:return_value) { double("return_value") }
  let(:orginal_method) { double("orginal_method") }
  let(:bound_method) { double("bound_method") }

  subject do 
    described_class.new(
      type: type,
      instance: instance,
      method_name: method_name,
      arguments: arguments,
      block: block,
      return_value: return_value,
      orginal_method: orginal_method,
      bound_method: bound_method
      )
  end

  describe "#type" do 
    it "has been initialized" do 
      subject.type.should == type
    end
  end

  describe "#instance" do 
    it "has been initialized" do 
      subject.instance.should == instance
    end
  end

  describe "#method_name" do 
    it "has been initialized" do 
      subject.method_name.should == method_name
    end
  end

  describe "#arguments" do 
    it "has been initialized" do 
      subject.arguments.should == arguments
    end
  end

  describe "#block" do 
    it "has been initialized" do 
      subject.block.should == block
    end
  end

  describe "#return_value" do 
    it "has been initialized" do 
      subject.return_value.should == return_value
    end
  end

  describe "#orginal_method" do 
    it "has been initialized" do 
      subject.orginal_method.should == orginal_method
    end
  end

  describe "#bound_method" do 
    it "has been initialized" do 
      subject.bound_method.should == bound_method
    end
  end

  describe "#proceed" do 
    before do 
      subject.should_receive(:block).and_return(block)
      subject.should_receive(:arguments).and_return([1, 2, 3])
      bound_method.should_receive(:call).with(1, 2, 3, &block).and_return(return_value)
    end
    it "calls next step" do 
      subject.proceed.should == return_value
    end
  end

end
