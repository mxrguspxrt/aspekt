require 'spec_helper'

describe Aspekt::Advice do 

  let(:advice_type) { double("advice_type") }
  let(:class1) { double("class1") }
  let(:class2) { double("class2") }
  let(:method1) { double("method1") }
  let(:method2) { double("method2") }

  subject do 
    described_class.new(
      advice_type,
      class1 => method1,
      class2 => [method1, method2]
      )
  end

  describe "#advice_type" do 
    it "is initialized" do 
      subject.advice_type.should == advice_type
    end
  end

  describe "#pointcuts_array" do 
    it "knows all the classes (including singleton_classes) and methods" do 
      subject.pointcuts_array.should == [
        [class1, method1], 
        [class2, method1],
        [class2, method2]
        ]
    end
  end

  describe "#weave" do 
    before do 
      Aspekt::MethodWeaver.should_receive(:weave).with(advice_type, class1, method1).and_return(true)
      Aspekt::MethodWeaver.should_receive(:weave).with(advice_type, class2, method1).and_return(true)
      Aspekt::MethodWeaver.should_receive(:weave).with(advice_type, class2, method2).and_return(true)
    end
    it "weaves block into code" do 
      subject.weave
    end
  end

end
