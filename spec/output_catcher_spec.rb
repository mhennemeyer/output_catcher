require File.dirname(__FILE__) + '/spec_helper'

describe "OutputCatcher" do
  
  describe ".catch_io" do
    
    it "should run the code in the associated block" do
      @var = 1
      OutputCatcher.catch_io "err" do
        @var = 2
      end
      @var.should be(2)
    end

    it "should read $stderr and return it" do
      for word in %w( Hello! Hallo! )
        err = OutputCatcher.catch_io "err" do
          $stderr << word
        end
        err.should == word
      end
    end
    
    it "should not output $stderr" do
      err = OutputCatcher.catch_err do
        OutputCatcher.catch_io "err" do
          $stderr << "Hello!"
        end
      end
      err.should be_empty
    end
  end
  
  describe ".catch_err" do
    it "should run the code in the associated block" do
      @var = 1
      OutputCatcher.catch_err do
        @var = 2
      end
      @var.should be(2)
    end

    it "should read $stderr and return it" do
      for word in %w( Hello! Hallo! )
        err = OutputCatcher.catch_err do
          $stderr << word
        end
        err.should == word
      end
    end
    
    it "should not output $stderr" do
      err = OutputCatcher.catch_err do
        OutputCatcher.catch_err do
          $stderr << "Hello!"
        end
      end
      err.should be_empty
    end
  end
  
  describe ".catch_out" do
    it "should run the code in the associated block" do
      @var = 1
      OutputCatcher.catch_out do
        @var = 2
      end
      @var.should be(2)
    end

    it "should read $stdout and return it" do
      for word in %w( Hello! Hallo! )
        out = OutputCatcher.catch_out do
          $stdout << word
        end
        out.should == word
      end
    end
    
    it "should not output $stdout" do
      out = OutputCatcher.catch_out do
        OutputCatcher.catch_out do
          $stdout << "Hello!"
        end
      end
      out.should be_empty
    end
  end
  
end