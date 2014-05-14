require 'spec_helper'

describe Aspekt::Pointcut do 

  subject do 
    described_class.new(Class, :to_s, :inspect)
  end

  describe "#type" do 
    it "is initialized" do 
      subject.type.should == Class
    end
  end

  describe "#method_names" do  
    it "is initialized" do 
      subject.method_names.should == [:to_s, :inspect]
    end
  end

end
