require 'spec_helper'

describe "Lists" do
  before :each do
    @list = ['a', 'b', 'c', 'd', 'e', 'f']
    @dup_list = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
  end

  describe "1.01 - my_last" do
    it "should return the last element of the array" do
      RubyProblems::PrologList.my_last(@list).should == @list.last
    end
  end

  describe "1.02 - second last element" do
    it "should return the second last element of the array" do
      RubyProblems::PrologList.second_last(@list).should == @list[@list.size - 2]
    end
  end

  describe "1.03 - element at index" do
    it "should return the asked element at the index" do
      RubyProblems::PrologList.element_at(@list, 2) == @list[1]
    end
  end

  describe "1.05 - reverse a list" do
    it "should reverse the list" do
      RubyProblems::PrologList.reverse(@list) == @list.reverse
    end
  end

  describe "1.06 - is a list palidrome" do
    it "it should return true for list [x, a, m, a, x]" do
      RubyProblems::PrologList.palindrome?(['x', 'a', 'm', 'a', 'x']).should be_true
    end

    it "should return false for [a, b, c, d]" do
      RubyProblems::PrologList.palindrome?(@list).should_not be_true
    end
  end

  describe "should flatten list [a, [b, [c, d], e]]" do
    it "should be equal tp [a, b, c, d, e]" do
      RubyProblems::PrologList.my_flatten(['a', ['b', ['c', 'd'], 'e'], 'f']).should == @list
    end
  end

  describe "1.08 - remove consecutive duplicates in list - [a,a,a,a,b,c,c,a,a,d,e,e,e,e]" do
    it "should return [a, b, c, a, d, e]" do
      RubyProblems::PrologList.compress(@dup_list).should == ['a', 'b', 'c', 'a', 'd', 'e']
    end
  end

  describe "1.09 - Pack consecutive duplicates of list elements [a,a,a,a,b,c,c,a,a,d,e,e,e,e] into sublists." do
    it "should return [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]" do
      RubyProblems::PrologList.pack(@dup_list).should == [['a', 'a', 'a', 'a'], ['b'], ['c', 'c'], ['a', 'a'], ['d'], ['e', 'e', 'e', 'e']]
    end
  end

  describe "Run length encodeing of  dup_list" do
    it "should return [[4,a],[1,b],[2,c],[2,a],[1,d][4,e]]" do
      RubyProblems::PrologList.encode(@dup_list).should == [[4, 'a'], [1, 'b'], [2, 'c'], [2, 'a'], [1, 'd'], [4, 'e']]
    end
  end

  describe "Run length modified encodeing of  dup_list" do
    it "should return [[4,a],b,[2,c],[2,a],d,[4,e]]" do
      RubyProblems::PrologList.encode_modified(@dup_list).should == [[4, 'a'], 'b', [2, 'c'], [2, 'a'], 'd', [4, 'e']]
    end
  end

  describe "Decode a run length encoded list [[4,a],b,[2,c],[2,a],d,[4,e]]" do
    it "should return [a,a,a,a,b,c,c,a,a,d,e,e,e,e]" do
      RubyProblems::PrologList.decode([[4, 'a'], 'b', [2, 'c'], [2, 'a'], 'd', [4, 'e']]).should == @dup_list
    end
  end

  describe "Run length direct encoding of  dup_list" do
    it "should return [[4,a],b,[2,c],[2,a],d,[4,e]]" do
      RubyProblems::PrologList.encode_direct(@dup_list).should == [[4, 'a'], 'b', [2, 'c'], [2, 'a'], 'd', [4, 'e']]
    end
  end
end
